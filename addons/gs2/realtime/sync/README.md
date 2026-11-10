# GS2-Realtime オブジェクト同期（Godot）

GS2-Realtime のルームで、オブジェクトの生成・削除、フィールドの値、RPC、ルームイベント、カスタムプロパティを同期します。ルールで動くルーム（GS2-StateMachine のルール）では、サーバーが共有オブジェクトを管理し、クライアントは入力を送ってその結果を予測できます。ルールの書き方は [rules/README.md](../rules/README.md) を参照してください。

## 最初の設定

1. **ネットワークプレハブを作る。** シーンのルート（`CharacterBody3D`、`Node2D` など）の**子ノード**として `Gs2NetworkEntity` を追加します。位置と回転を同期するときは、さらに `Gs2NetworkTransform3D`（2D なら `Gs2NetworkTransform2D`）を子ノードとして追加します。どちらも既定で親（`target = ".."`）を対象にします。
2. **プレハブカタログを作る。** 新しいリソースとして `Gs2NetworkPrefabCatalog` を作り、`prefabs` にエントリ（`Gs2NetworkPrefabEntry`：ルームで使うプレハブ ID と PackedScene）を追加します。インスペクターには、ID の重複、シーンや Entity の欠落、ほかのプレハブ用の schema が警告として表示されます。
3. **ワールドを置く。** 同期するシーンに `Gs2NetworkWorld` と `Gs2NetworkSession` を置き、World の `catalog` にカタログを、Session の `world` に World を設定します。
4. **接続して生成する。** GS2-Realtime から受け取ったルームのアドレス（アクセストークン、IP アドレス、ポート、暗号鍵）で接続します。

```gdscript
extends Node

const PLAYER_PREFAB := 1 # カタログのエントリの ID

@onready var world: Gs2NetworkWorld = $World
@onready var session: Gs2NetworkSession = $Session


func _ready() -> void:
    session.room_ready.connect(_on_room_ready)
    world.spawned.connect(_on_spawned)
    session.disconnected.connect(func(reason: String) -> void: print("Disconnected: ", reason))


# 接続を始めるだけです。もう一度呼ぶと再接続します。
func join(access_token: String, ip_address: String, port: int, encryption_key: String) -> void:
    if not session.connect_room(access_token, ip_address, port, encryption_key):
        push_error(session.last_error)


func _on_room_ready() -> void:
    # すぐに使えます（移動・RPC）。フィールドはルームが生成を確定してから存在します。
    world.instantiate(PLAYER_PREFAB, Vector3.ZERO)


func _on_spawned(entity: Gs2NetworkEntity) -> void:
    if entity.is_mine():
        print("My player is in the room: ", entity.get_parent().name)
```

## 接続

`Gs2NetworkSession` は GS2-Realtime のセッションを開き、World をつなぎ、パケットを順番どおりに送ります。受け取ったメッセージは、サーバーの時刻とともに World に渡します。状態の更新には、使えるときは UDP を使います（Web 版では WebSocket だけを使います）。

- **状態（`state`）:** `DISCONNECTED` / `CONNECTING` / `SYNCHRONIZING`（スナップショットを適用中）/ `READY` のいずれかです。
- **シグナル:** `attached(client)`、`room_ready`、`disconnected(reason)` を出します。
- **終了:** ノードが無効になったとき（`process_mode = DISABLED`）、ツリーから外れたとき、`disconnect_room()` を呼んだときに終わります。

Session と World は一時停止の影響を受けません（`PROCESS_MODE_ALWAYS`）。経過時間はゲームの時間ではなく実時間で測ります。

## 生成と所有

- **`world.instantiate(prefab_id, position, rotation)`:** インスタンスをすぐに返します。返したインスタンスは `is_mine()` で、そのまま動かしたり RPC を送ったりできます。ルームが生成を確定すると `is_spawned()` が true になります。ルームが拒否した場合は `spawn_failed` が出て、インスタンスは消えます。
- **`world.spawn(prefab_id, position, rotation)`:** ルームの確定を待ってからインスタンスを作ります。`Gs2SpawnRequest` を返します。
  - `await request.wait()` で完了を待てます。完了済みならすぐ返ります。
  - 状態（`status`）は `SUCCEEDED`（`entity` がある）、`REFUSED`、`NOT_SENT`、`ABANDONED` のいずれかです。
  - 2D では `Vector2` の位置とラジアンの回転、3D では `Vector3` の位置と `Quaternion` / `Basis` / オイラー角（ラジアン）の回転を渡せます。
- **`is_mine()`:** プレイヤーオブジェクトの所有者と、リースしているオブジェクトの現在の保持者では true です。`owner_id` はその接続 ID です。
- **所有権:** `entity.transfer_ownership(connection_id)` で、プレイヤーオブジェクトをほかのメンバーに渡せます。
- **削除:** `entity.destroy()` で、自分のプレイヤーオブジェクトを消せます。

## フィールドとプロパティバインディング

位置と回転だけなら schema は要りません。ルームの許可は、ルール（`Gs2Room.define_leased_prefab_raw(5, Gs2RoomSync.POSITION, 6000)` など）か、ネームスペースのオブジェクトカタログで与えます。

独自のフィールドを使う手順は次のとおりです。

1. ルールの `## @room_schema` の enum から、コンパイラが `godot/<Name>.realtimeschema` を生成します。
2. 生成されたファイルをプロジェクトに置くと、`Gs2NetworkSchema` として取り込まれます。
3. 取り込んだ schema を `Gs2NetworkEntity.schema` に設定します。

値の読み書きと変化の受け取り方は次のとおりです。

- **読み書き:** `entity.get_int("Hp")` / `set_int("Hp", 100)`（`get_bool` / `get_float` も同様）で、名前を指定して読み書きします。
  - 書き込んだクライアントの `get_*` は、自分が最後に書いた値を返します。
  - 常にルームの最新の値を読みたいときは `get_confirmed_*` を使います。
- **変化の受け取り:**
  - `field_changed(field_name, value)` シグナルを使うか、`property_bindings`（フィールド名、対象のノード、プロパティまたはメソッド）で、ほかのノードに自動で反映します。
  - 毎回の送信の直前に書き込むときは `_network_write(entity)`、受信したときに読むときは `_network_read(entity, changed)` を、プレハブ内のノードに実装します（Unity の `INetworkObservable` に相当）。

コンパイラは型付きのアクセサも生成します（`CharacterSchema.hp(o)`、`set_hp(values, 100)` など）。どの書き込みを生成するかは、ルームがクライアントから受け付ける書き込みに合わせています。

## RPC とルームイベント

RPC は**メソッド名から自動で**バインドされます。対象になるのは、Entity の親の配下にあるノード（入れ子になった別の Entity の配下は除く）のメソッドです。

```gdscript
# 所有者だけが呼べる RPC
func net_rpc_fire(direction: Vector3, damage: int, info: Gs2NetworkRpcInfo) -> void:
    print("fired by ", info.sender)

# どのメンバーも呼べる RPC（オブジェクトカタログの publicMethods）
func net_rpc_public_cheer(info: Gs2NetworkRpcInfo) -> void:
    pass
```

```gdscript
entity.send_rpc("fire", Gs2SyncTypes.RpcTarget.OTHERS, Vector3.FORWARD, 10)
entity.rpc_to("fire", connection_id, Vector3.FORWARD, 10)
```

- **ID:** RPC の ID は、接頭辞を除いた名前（`fire`）の FNV-1a です。**メソッド名を変えると ID も変わります。** カタログを更新し、クライアントもそろえて更新してください。
- **送り先:** `ALL`、`OTHERS`、`OWNER`、`ALL_BUFFERED`、`OTHERS_BUFFERED` を指定できます。Buffered の呼び出しは、あとから参加したプレイヤーにも再生されます。
- **引数:** 型付きで宣言します。型のない引数と `Variant` の引数はエラーになります。
  - 使える型: `bool`、`int`（enum を含む）、`float`、`String`、`PackedByteArray`、`Vector2` / `3` / `4`、`Vector2i` / `3i`、`Quaternion`、`Color`
  - 最後の `Gs2NetworkRpcInfo` 引数には、送り手（`sender`）などが入ります。
- **呼ばれるタイミング:** 受け取った RPC はパケットを適用した後に呼ばれます。そのため、ハンドラの中からそのまま送信できます。`await` を使うハンドラも呼べます。
- **ルームイベント:** `net_event_<name>` という名前のメソッドを持つノードを `world.add_event_target(node)` で登録し、`world.raise_event("round_start", Gs2SyncTypes.RpcTarget.OTHERS, 3)` で送ります。

`Node.rpc()` などとの衝突を避けるため、送信のメソッドは `send_rpc` という名前にしています。

## 共有オブジェクト

ルールが管理するオブジェクトは `Gs2SharedObject` で扱います。`interact(method)`、`acquire()`、`renew()`、`release()` は `Gs2CommandRequest` を返します。リースを持つ間だけ動かしたいノードは、Entity の `controlled_nodes` に指定します。`acquire_control()` は、制御を得るまで待てるリクエストを返します。

## Tick と予測

`Gs2Room.define_tick_rate` を使うルームでは、`world.set_input(slot, value)` で入力を送ります（`TickInput.MOVE_X` などの生成された定数を使います）。

コンパイラが生成する `<Rules>Prediction.register(world)` を一度呼ぶと、自分が所有するオブジェクトについて、ルームと同じ計算で先の tick を予測します。

- **予測とルームの結果が違ったとき:** 次の確定状態から予測をやり直します。違いは Transform がなめらかに吸収します。
- **予測が int32 の範囲外などで失敗したとき:** ルームの状態をそのまま表示します。

## インタレストグループ、マスタークライアント、カスタムプロパティ

- **インタレストグループ:**
  - `entity.set_group(group)` で、所有者はオブジェクトをグループに移せます。
  - 移したオブジェクトの更新は、`world.subscribe_group(group)` したメンバーにだけ届きます。グループ 0 は全員に届きます。
- **マスタークライアント:** `world.master_client_id` で読めます。変わったときは `master_client_changed` が出ます。マスターは `set_master_client(id)` でほかのメンバーを指名できます。
- **カスタムプロパティ:**
  - `world.set_room_property(key, value)` / `set_player_property(key, value)` で書き込み、`room_property(key, fallback)` で読みます。
  - 書き込みはルームが反映してから適用されるので、全員が同じ順番で値を見ます。

## Transform

`Gs2NetworkTransform2D` / `3D` は、所有者の動きを送り、ほかのメンバーの動きを補間して表示します。

**2D（`Gs2NetworkTransform2D`）**
- 位置 X / Y（スロット 0 / 1）と回転 Z（スロット 5）を同期します。回転は度に直し、0〜360 に正規化して送ります。
- Y 軸は反転しません。ルールにはピクセル座標がそのまま届きます。
- 既定の精度（1 段階 0.01）はピクセルには細かすぎます。`## @room_schema(..., standard=POSITION, position_precision=1.0)` などで粗くすることをお勧めします。

**3D（`Gs2NetworkTransform3D`）**
- 位置 3 軸と回転 3 軸（スロット 0〜5）を同期します。
- オイラー角の順序は **YXZ** に固定しています。回転 3 軸すべてを同期するときは、Quaternion で補間します。

**共通の設定**
- `interpolation_delay`（既定 0.1 秒）: その秒数だけ過去の姿勢を、受け取った 2 つの更新の間で補間して表示します。
- `teleport_distance`: この距離より遠くへ動いたときは、補間せずに瞬間移動します。
- `snap_to_network()`: 呼び出したときに、ネットワークの姿勢へ即座に合わせます。

## エディタの道具

**プロジェクト > ツール > GS2** から、次の 2 つのコマンドを使えます。

- **Build Realtime Rules:** プロジェクトの GDScript のルールをビルドします（[rules/README.md](../rules/README.md)）。
- **Copy Object Catalog JSON:** インスペクターで選択している `Gs2NetworkPrefabCatalog` から、ネームスペースの `syncSetting.objectCatalog` に貼る JSON をクリップボードにコピーします。ルールが定義するプレハブ（`Gs2SharedObject` と、ルールが定義する schema のもの）は除かれます。

インスペクターでは、Entity の RPC とその ID、カタログの問題を確認できます。

## UDP と Web

`udp_secret` があり（ルームが UDP を提供している）、Web 以外で動いているときは、Session が UDP のチャネルを開きます。状態の更新だけを UDP で送り、コマンド・RPC・イベントは WebSocket で送ります。UDP の応答が 10 秒途絶えると、WebSocket に戻ります。

Web 版では UDP は使えません。また、https で配信するページからは `ws://` に接続できないことがあります（mixed content）。

## エラーの扱い

GDScript には例外がないので、失敗は戻り値（`false` や `null`）で返り、理由は `last_error` に入ります。使い方の誤りは `push_error` でも報告します。ネットワークから受け取った不正なパケットについては、`receive` が false を返し、Session が接続を閉じます。

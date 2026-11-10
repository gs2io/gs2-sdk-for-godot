# AirHockey（2D）

Unity の [AirHockey サンプル](../../../../unity/Assets/Scenes/Samples/Realtime/AirHockey/README.md) を Godot の 2D に移植したものです。パドルは操作権（リース）を借りたメンバーが動かし、パックの動きと得点はルームのルールが計算します。

- **パドル（青 = プレハブ ID 5、赤 = 6）:** **Join blue** / **Join red** で、そのパドルのリースを取ります（`Gs2NetworkEntity.acquire_control`。持っている間は自動で更新します）。リースを持つ間だけ `paddle_movement.gd` が動き、WASD / 矢印キー / マウスのドラッグでパドルを動かせます。ほかのメンバーが持っているパドルは `LEASE_BUSY` で断られます。**Spectate** で返します。
- **パック（ID 7）:** ルールが 50 ms ごとに 4 回ずつ動かし、レールとパドルで跳ね返し、ゴールを数えます（物理エンジンは使いません）。**Start / reset** で得点を 0 にしてサーブし、**Pause** で中央に止めます。
- **得点:** パックの `BlueScore` / `RedScore` / `Phase` / `Hits` を、プロパティバインディングでパックの `Score` ノード（`hockey_score.gd`）に反映し、盤面の上に表示します。

接続を切ってもルームが残っている間は、パックと得点が残ります。

## ファイル

| パス | 内容 |
|---|---|
| `air_hockey.tscn` / `air_hockey_sample.gd` | シーンと操作。盤面、World / Session、接続・操作のパネル |
| `prefabs/` / `air_hockey_catalog.tres` | プレハブ（BluePaddle / RedPaddle / Puck）とカタログ |
| `rules/air_hockey_room.gd` | ルームのルール（GDScript）。Godot では実行しません |
| `generated/` | ルールから生成したクラス（`PuckStateSchema`、`PuckAction` など）と `.realtimeschema` |
| `../shared/realtime_sync_sample.gd` | 2 つのサンプルに共通の接続とパネル |

## ルールをビルドする

ルールを変えたら、ビルドし直して `generated/` を更新します。

**エディタから:** **プロジェクト > ツール > GS2 > Build Realtime Rules** を実行します。このリポジトリの `project.godot` には、2 つのサンプルのルールの組がプロジェクト設定 `gs2/realtime/rule_sets` に登録してあるので、両方まとめてビルドされます。コンパイラの場所は、エディタ設定の `gs2/realtime/compiler_path` に設定してください。

サンプルを自分のプロジェクトにコピーしたときは、ルールが 1 つだけなら、次のプロジェクト設定を指定します。

| 設定 | 値 |
|---|---|
| `gs2/realtime/rules_directory` | `res://samples/realtime/air_hockey/rules` |
| `gs2/realtime/generated_directory` | `res://samples/realtime/air_hockey/generated` |
| `gs2/realtime/package_directory` | `res://../build/realtime/air_hockey` |

ほかのルールもあるときは、`gs2/realtime/rule_sets` に次の組を足します。

```
{"rules": "res://samples/realtime/air_hockey/rules", "generated": "res://samples/realtime/air_hockey/generated", "package": "res://../build/realtime/air_hockey"}
```

**コマンドラインから:** 出力先はプロジェクトの外にします。`godot/*` を `generated/` にコピーします。

```sh
gs2-realtime-compiler --build godot/samples/realtime/air_hockey/rules --output build/air_hockey
cp build/air_hockey/godot/* godot/samples/realtime/air_hockey/generated/
```

サーバーに登録する `package.zip`（`main.gsl` を含む）はリポジトリに含めません。ルールのスクリプトはゲームの実行には使わないので、エクスポートのフィルターで `samples/realtime/*/rules/*` を除外してください。

## ルームを用意する

手順は [ルールの README](../../../addons/gs2/realtime/rules/README.md#ビルドと登録) と同じです。

1. **ルールを登録する。** `package.zip` の `main.gsl` を GS2-StateMachine の `UpdateStateMachineMaster` に登録します。`MainStateMachineName` は `AirHockeyRoom` です。
2. **ネームスペースを作る。** GS2-Realtime のネームスペースの `stateMachineSetting` に、登録したステートマシンのネームスペースとバージョンを指定します。
3. **オブジェクトカタログは不要です。** パドルとパックはどれもルールが定義します（Copy Object Catalog JSON の結果も `{}` です）。
4. **ルームに入る。** GS2-Realtime でルームを作り（`wantRoom`）、ルームの IP アドレス・ポート・暗号鍵と、ログインしたプレイヤーのアクセストークンを用意します。

Unity のサンプルの README にあるローカルの手順（Realtime リポジトリの `run-webgl-sample.sh`）は、Unity の WebGL ビルドを配る前提です。そのローカルのルームサーバーを使うときは、`-gsl` にこのサンプルの `main.gsl` を、`-main` に `AirHockeyRoom` を指定し、パネルの Bootstrap URL（`http://127.0.0.1:18080/bootstrap`）からアドレスを読み込みます。

## 2 つのインスタンスで動かす

シーンにはアドレスを持たせません。パネル（**Connect**、または Bootstrap URL から **Fetch**）、ルートノードのインスペクター（秘密の値をコミットしないでください）、コマンドラインのどれかで渡します。

```sh
cd godot
godot --path . res://samples/realtime/air_hockey/air_hockey.tscn -- \
  --gs2-access-token=TOKEN_A --gs2-ip-address=IP --gs2-port=PORT --gs2-encryption-key=KEY &
godot --path . res://samples/realtime/air_hockey/air_hockey.tscn -- \
  --gs2-access-token=TOKEN_B --gs2-ip-address=IP --gs2-port=PORT --gs2-encryption-key=KEY &
```

アクセストークンはプレイヤーごとに別のものを使います。エディタからは **デバッグ > 実行インスタンスのカスタマイズ**（Customize Run Instances）でインスタンスを 2 つにすると、同時に起動できます。一方で **Join blue**、もう一方で **Join red** を押し、**Start / reset** で始めます。

## Unity 版との違い

- **2D:** Unity 版は 3D の XZ 平面（センチメートル）で動きます。この版は `Node2D` と `Gs2NetworkTransform2D` を使い、ルールの Z を Y に置き換えています。座標は盤面のピクセルで、原点は中央、Y は下向きです。ルールの数値（盤面 ±616 × ±304、パドルとパックの半径の和 52 など）は Unity 版と同じです。
- **位置の精度:** ピクセルで扱うため、3 つのプレハブとも `## @room_schema(..., standard=POSITION, position_precision=1.0)` にしています（Unity 版は標準の 0.01）。そのため、パドルにも schema（`BluePaddleState` / `RedPaddleState`）があり、ルールは `define_leased_prefab(BluePaddleState, 6000)` で定義します。
- **名前付きの定数:** パックの操作（`PuckAction`）とタイマー（`PuckTimer`）を enum にしています。エラーの enum は `HockeyError` です。
- **パックの計算:** C# の `record Motion` と `p with { ... }` は、GDScript の `class Motion extends Gs2Record` と `p.with({...})` で書いています。
- **UI:** Unity の OnGUI（エディタのみ）と WebGL のページの代わりに、シーンにパネルを作ります。パドルを動かすボタン（Unity の WebGL 用）はありません。

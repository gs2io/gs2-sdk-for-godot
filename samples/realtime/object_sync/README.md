# ObjectSync（3D）

Unity の [ObjectSync サンプル](../../../../unity/Assets/Scenes/Samples/Realtime/ObjectSync/README.md) を Godot に移植したものです。プレイヤーの移動と RPC、ルールが管理する共有オブジェクト（箱・扉・敵）を同期します。

- **プレイヤー（プレハブ ID 1）:** 各メンバーが `world.instantiate` で生成します。WASD / 矢印キーで動き、**Send RPC** でそのプレイヤーが全員の画面で一時的に大きくなります。RPC は `sample_pulse.gd` の `net_rpc_pulse` で、ID は名前から決まります（`Gs2NetworkRpc.id_of("pulse")`）。
- **箱（ID 2）:** 操作権（リース）を取得したメンバーだけが動かせます。リースは 6 秒で切れます（**Acquire** / **Renew** / **Release**）。
- **扉（ID 3）:** **Open door** / **Close door** で開け閉めします。開くと 8 秒後に自動で閉まります。扉の角度はルールが書く `RotationY` から `Gs2NetworkTransform3D` が反映します。
- **敵（ID 4）:** **Hit enemy** で体力が 25 減ります。体力が 0 になると 8 秒後に復活します。体力バーは `Health` フィールドのプロパティバインディングで更新します。

接続を切っても共有オブジェクトはルームに残り、再接続すると最新の状態が復元されます。

## ファイル

| パス | 内容 |
|---|---|
| `object_sync.tscn` / `object_sync_sample.gd` | シーンと操作。World / Session と、接続・操作のパネル |
| `prefabs/` / `object_sync_catalog.tres` | プレハブ（Player / Box / Door / Enemy）とカタログ |
| `rules/object_sync_room.gd` | ルームのルール（GDScript）。Godot では実行しません |
| `generated/` | ルールから生成したクラス（`DoorStateSchema`、`DoorAction` など）と `.realtimeschema` |
| `../shared/realtime_sync_sample.gd` | 2 つのサンプルに共通の接続とパネル |

## ルールをビルドする

ルールを変えたら、ビルドし直して `generated/` を更新します。

**エディタから:** **プロジェクト > ツール > GS2 > Build Realtime Rules** を実行します。このリポジトリの `project.godot` には、2 つのサンプルのルールの組がプロジェクト設定 `gs2/realtime/rule_sets` に登録してあるので、両方まとめてビルドされます。コンパイラの場所は、エディタ設定の `gs2/realtime/compiler_path` に設定してください。

サンプルを自分のプロジェクトにコピーしたときは、ルールが 1 つだけなら、次のプロジェクト設定を指定します。

| 設定 | 値 |
|---|---|
| `gs2/realtime/rules_directory` | `res://samples/realtime/object_sync/rules` |
| `gs2/realtime/generated_directory` | `res://samples/realtime/object_sync/generated` |
| `gs2/realtime/package_directory` | `res://../build/realtime/object_sync` |

ほかのルールもあるときは、`gs2/realtime/rule_sets` に次の組を足します。

```
{"rules": "res://samples/realtime/object_sync/rules", "generated": "res://samples/realtime/object_sync/generated", "package": "res://../build/realtime/object_sync"}
```

**コマンドラインから:** 出力先はプロジェクトの外にします。`godot/*` を `generated/` にコピーします。

```sh
gs2-realtime-compiler --build godot/samples/realtime/object_sync/rules --output build/object_sync
cp build/object_sync/godot/* godot/samples/realtime/object_sync/generated/
```

サーバーに登録する `package.zip`（`main.gsl` を含む）はリポジトリに含めません。ルールのスクリプトはゲームの実行には使わないので、エクスポートのフィルターで `samples/realtime/*/rules/*` を除外してください。

## ルームを用意する

手順は [ルールの README](../../../addons/gs2/realtime/rules/README.md#ビルドと登録) と同じです。

1. **ルールを登録する。** `package.zip` の `main.gsl` を GS2-StateMachine の `UpdateStateMachineMaster` に登録します。`MainStateMachineName` は `ObjectSyncRoom` です。
2. **ネームスペースを作る。** GS2-Realtime のネームスペースの `stateMachineSetting` に、登録したステートマシンのネームスペースとバージョンを指定します。
3. **オブジェクトカタログ（任意）。** 箱・扉・敵はルールが定義するので、カタログは要りません。RPC や生成をサーバーで検査したいときは、`object_sync_catalog.tres` を選んで **プロジェクト > ツール > GS2 > Copy Object Catalog JSON** を実行し、ネームスペースの `syncSetting.objectCatalog` に貼り付けます。中身はプレイヤーだけです。

   ```json
   {"1":{"fields":63,"mode":"player","methods":[1426849438]}}
   ```

4. **ルームに入る。** GS2-Realtime でルームを作り（`wantRoom`）、ルームの IP アドレス・ポート・暗号鍵と、ログインしたプレイヤーのアクセストークンを用意します。

Unity のサンプルの README にあるローカルの手順（Realtime リポジトリの `run-webgl-sample.sh`）は、Unity の WebGL ビルドを配る前提です。そのローカルのルームサーバーを使うときは、`-gsl` にこのサンプルの `main.gsl` を、`-main` に `ObjectSyncRoom` を指定し、パネルの Bootstrap URL（`http://127.0.0.1:18080/bootstrap`）からアドレスを読み込みます。

## 2 つのインスタンスで動かす

シーンにはアドレスを持たせません。次のどれかで渡します。

- **パネル:** 起動後、左上のパネルにアクセストークン・IP アドレス・ポート・暗号鍵を入力して **Connect** を押します（**Fetch** は Bootstrap URL から読み込みます）。
- **インスペクター:** ルートノードの `access_token` などに設定します。秘密の値をシーンに保存してコミットしないでください。
- **コマンドライン:** `--` の後に 4 つすべてを渡すと、起動してすぐに接続します。

```sh
cd godot
godot --path . res://samples/realtime/object_sync/object_sync.tscn -- \
  --gs2-access-token=TOKEN_A --gs2-ip-address=IP --gs2-port=PORT --gs2-encryption-key=KEY &
godot --path . res://samples/realtime/object_sync/object_sync.tscn -- \
  --gs2-access-token=TOKEN_B --gs2-ip-address=IP --gs2-port=PORT --gs2-encryption-key=KEY &
```

アクセストークンはプレイヤーごとに別のものを使います。エディタからは **デバッグ > 実行インスタンスのカスタマイズ**（Customize Run Instances）でインスタンスを 2 つにすると、同時に起動できます。インスタンスごとの起動引数に上の `--gs2-...` を書くか、起動後にパネルから入力します。

## Unity 版との違い

- **箱の操作権:** Unity 版は、箱（ID 2）のリースをネームスペースのオブジェクトカタログで与えます。この版はルール（`define_leased_prefab_raw(2, Gs2RoomSync.TRANSFORM, 6000)`）で定義し、扉と敵も `define_server_prefab` で定義します。そのためカタログがなくても動きます。
- **名前付きの定数:** 扉と敵の操作（`DoorAction` / `EnemyAction`）、タイマー（`RoomTimer`）を enum にしています。エラーの enum は `ObjectSyncError` です（`RoomError` は SDK のテストのルールが使っています）。
- **RPC の ID:** Unity 版は `[NetworkRpc(1)]` で固定した ID 1 です。Godot はメソッド名から ID を決めます。
- **回転:** オイラー角は Godot の YXZ です（Unity は ZXY）。扉は Y 軸だけを回すので、見た目は同じです。
- **UI:** Unity の OnGUI（エディタのみ）と WebGL のページの代わりに、シーンにパネルを作ります。

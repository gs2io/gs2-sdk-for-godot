# GS2 SDK for Godot

[Game Server Services (GS2)](https://gs2.io/) を Godot から利用するための SDK です。[GS2 SDK for GDScript](https://github.com/gs2io/gs2-gdscript-sdk) の低レベル API に加えて、ゲーム向けの認証、ゲームセッション、キャッシュ、サーバープッシュ通知を扱う高レベル API を提供します。

高レベルのドメイン API は、サービスごとに `Gs2EzDomain.account`、`Gs2EzDomain.inbox`、`Gs2EzDomain.inventory` のようにアクセスできます。

## 動作条件

- Godot Engine 4.7 以降
- GS2 のプロジェクトとクレデンシャル

GS2 を初めて利用する場合は、[GS2 のセットアップ](https://docs.gs2.io/ja/get_start/tutorial/setup_gs2/) を先に完了してください。

## インストール

1. [リリース一覧](https://github.com/gs2io/gs2-sdk-for-godot/releases) から利用するバージョンをダウンロードして展開します。
2. `addons/gs2` ディレクトリを Godot プロジェクトの `addons/gs2` にコピーします。
3. Godot Editor でプロジェクトを開き直し、スクリプトのインポートが完了するまで待ちます。

低レベルの GDScript SDK は `addons/gs2/gdscript` に同梱されています。GS2 SDK for GDScript を別途インストールする必要はありません。

## クイックスタート

次の例は、匿名アカウントを作成してログインし、GS2-Inbox のメッセージ一覧を取得します。事前に GS2-Account、GS2-Key、GS2-Inbox の各リソースを作成してください。

```gdscript
extends Node

const ACCOUNT_NAMESPACE_NAME := "account-namespace"
const ENCRYPTION_KEY_GRN := "grn:gs2:...:key:...:key"
const INBOX_NAMESPACE_NAME := "inbox-namespace"

var connection: Gs2Connection
var game_session: Gs2GameSession
var ez: Gs2EzDomain


func _ready() -> void:
    var credential := Gs2BasicCredential.new(
        "your-client-id",
        "your-client-secret",
    )
    connection = Gs2Connection.new(
        credential,
        Gs2Region.AP_NORTHEAST_1,
    )
    ez = Gs2EzDomain.new(connection)

    var create_result: Gs2AsyncResult = await ez.account \
        .namespace_(ACCOUNT_NAMESPACE_NAME) \
        .create()
    if create_result.error != null:
        push_error(str(create_result.error))
        return

    var model_result: Gs2AsyncResult = await create_result.result.model()
    if model_result.error != null:
        push_error(str(model_result.error))
        return
    var account: Gs2AccountEzAccount = model_result.result

    var authenticator := Gs2AccountAuthenticator.new(
        ACCOUNT_NAMESPACE_NAME,
        ENCRYPTION_KEY_GRN,
    )
    game_session = Gs2GameSession.new(
        authenticator,
        connection,
        account.user_id,
        account.password,
    )
    var login_result: Gs2AsyncResult = await game_session.login()
    if login_result.error != null:
        push_error(str(login_result.error))
        return

    var messages_result: Gs2AsyncResult = await ez.inbox \
        .namespace_(INBOX_NAMESPACE_NAME) \
        .me(game_session) \
        .messages() \
        .load()
    if messages_result.error != null:
        push_error(str(messages_result.error))
        return

    for message in messages_result.result:
        print(message.name)
```

通信を行うメソッドは `Gs2AsyncResult` を返します。成功時の値は `result`、失敗時の `Gs2Exception` は `error` に格納されます。`Gs2Connection` は必要に応じてセッションの再接続やアクセストークンの再認証を行います。

利用を終了するときは、REST / WebSocket セッションを明示的に閉じられます。

```gdscript
connection.disconnect_session()
```

## サーバープッシュ通知

`Gs2AccountAuthenticator` の第3引数に GS2-Gateway のネームスペース名を指定すると、ログイン後に通知を受信できます。サービスごとのドメインは、ペイロードを対応する通知型へ変換してシグナルを発行します。

```gdscript
var authenticator := Gs2AccountAuthenticator.new(
    ACCOUNT_NAMESPACE_NAME,
    ENCRYPTION_KEY_GRN,
    "gateway-namespace",
    true, # allow_concurrent_access
)

ez.chat.post_notification.connect(func(notification: Gs2ChatPostNotification):
    print(notification.namespace_name)
    print(notification.room_name)
)
```

## リアルタイム（オブジェクト同期とルール）

GS2-Realtime のルームで、オブジェクト・フィールド・RPC・ルームイベントを同期できます。

- **ノード:** `Gs2NetworkWorld` / `Gs2NetworkSession` を置き、ネットワークで同期するシーンのルートの子に `Gs2NetworkEntity` と `Gs2NetworkTransform2D` / `3D` を置きます。
- **RPC:** `net_rpc_<name>` という名前のメソッドが自動でバインドされます。
- **ルール:** ルームのルールは GDScript で書けます。ルールのスクリプトから、サーバーで動く GSL と、ゲームが使うクラス（schema のアクセサ、予測など）を生成します。

詳しくは次を参照してください。

- [オブジェクト同期](addons/gs2/realtime/sync/README.md)
- [GDScript でルールを書く](addons/gs2/realtime/rules/README.md)

ルールのビルドには、[リリース](https://github.com/gs2io/gs2-sdk-for-godot/releases) で配布する `gs2-realtime-compiler` を使います（プロジェクト > ツール > GS2 > Build Realtime Rules）。

## ドキュメント

- [GS2 ドキュメント](https://docs.gs2.io/ja/)
- [Game Engine 向けガイド](https://docs.gs2.io/ja/get_start/#game-engine)
- [API リファレンス](https://docs.gs2.io/ja/api_reference/)
- [リリース一覧](https://github.com/gs2io/gs2-sdk-for-godot/releases)

## フィードバック

不具合や機能要望は [GitHub Issues](https://github.com/gs2io/gs2-sdk-for-godot/issues) でお知らせください。サービスごとの API やモデルの多くは自動生成されるため、生成コードへの変更提案も、まず Issue でご相談ください。

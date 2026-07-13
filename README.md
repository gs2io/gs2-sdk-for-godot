# GS2 SDK for Godot

Game Server Services (https://gs2.io) を Godot 4 (GDScript) から利用するための SDK です。

gs2-sdk-for-unity に相当する、ゲーム内から利用しやすい簡易インターフェース (Ez レイヤー) を提供します。
低レベル API クライアント (gs2-gdscript-sdk 相当) も同梱しています。

## 構成

```
addons/gs2/
  gdscript/                 gs2-gdscript-sdk（開発ツリーではシンボリックリンク）
    core/                   コアランタイム
    {service}/              低レベル API クライアント
  ez/                       エンジン向けレイヤーのコア
    gs2_connection.gd       接続・再認証リトライ
    gs2_game_session.gd     ゲームセッション (アクセストークン管理)
    gs2_account_authenticator.gd  GS2-Account による認証
    guild_game_session.gd   Guild アクセストークンのセッション管理
    gs2_guild_guild_authenticator.gd  GS2-Guild Assume による認証
  {service}/                サービスごとの Godot 生成コード
    ez/                     簡易インターフェース
      model/ result/ gs2_{service}_client.gd
```

`gdscript` 以下と `{service}/ez` 以下のコードは [gs2-sdk-gen](https://github.com/gs2io/gs2-sdk-gen) によって生成されています。直接編集しないでください。公開パッケージではシンボリックリンクを展開し、GDScript SDK を同梱します。

## 使い方

```gdscript
# 初期化
var credential = Gs2BasicCredential.new("クライアントID", "クライアントシークレット")
var connection = Gs2Connection.new(credential, Gs2Region.AP_NORTHEAST_1)

# ログイン
var authenticator = Gs2AccountAuthenticator.new(
    "アカウントネームスペース名",
    "暗号鍵GRN",
)
var game_session = Gs2GameSession.new(authenticator, connection, "ユーザーID", "パスワード")
var login_result = await game_session.login()
if login_result.error != null:
    push_error(str(login_result.error))
    return

# API 呼び出し (例: GS2-Inbox のメッセージ一覧)
var inbox = Gs2InboxClient.new(connection)
var result = await inbox.list(game_session, "ネームスペース名")
if result.error != null:
    push_error(str(result.error))
    return
for message in result.result.items:
    print(message.name)
```

- すべての API は `await` で呼び出し、`Gs2AsyncResult` (`result` / `error`) を返します。GDScript には例外がないため、`error` の null チェックでハンドリングしてください。
- アクセストークンの期限切れ (`UnauthorizedException`) は `Gs2Connection.run` が自動的に再認証してリトライします。

## サーバープッシュ通知

`Gs2AccountAuthenticator` に GS2-Gateway のネームスペース名を渡すと、ログイン時に通知の受信登録 (SetUserId) が行われます。

```gdscript
var authenticator = Gs2AccountAuthenticator.new(
    "アカウントネームスペース名",
    "暗号鍵GRN",
    "Gatewayネームスペース名",  # 省略可
    true,                        # allow_concurrent_access
)

connection.notification_received.connect(func(message):
    # message: Gs2NotificationMessage (issuer / subject / payload)
    var notification = message.parse()  # 生成済み通知モデルへ自動デシリアライズ
    if notification is Gs2FriendAcceptRequestNotification:
        print("フレンドリクエストが承認されました: ", notification.target_user_id)
)
```

`parse()` は `subject` (例: `Gs2Friend:AcceptRequestNotification`) から対応する通知モデルを解決します。対応するモデルがない場合 (ユーザー発行の通知など) は null を返すので、`message.payload` を直接参照してください。

## Guild セッション

Guild を主体として Experience や Exchange を実行する場合は、ユーザーの `Gs2GameSession` から `GuildGameSession` を作成します。

```gdscript
var guild_authenticator = Gs2GuildGuildAuthenticator.new(
    "Guildネームスペース名",
    "Guildモデル名",
    "Gatewayネームスペース名",
    true,
)
var guild_game_session = GuildGameSession.new(
    guild_authenticator,
    connection,
    game_session,
    "Guild名",
)
var assume_result = await guild_game_session.login()
if assume_result.error != null:
    push_error(str(assume_result.error))
    return
```

`GuildGameSession` は WebSocket 切断後に再認証し、Guild のアクセストークンを `access_token` に更新します。

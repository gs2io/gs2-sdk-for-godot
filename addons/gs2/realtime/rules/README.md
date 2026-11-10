# GS2-Realtime のルールを GDScript で書く

GS2-Realtime のルームは、GS2-StateMachine に登録したルールで動かせます。ルームが共有オブジェクトを管理し、メンバーの操作（interact）、タイマー、固定レートの tick を処理します。このディレクトリのスタブ（`Gs2RoomRules`、`Gs2Record`、`Gs2Step`、`Gs2Room`、`Gs2RoomSync`）を使って GDScript でルールを書くと、エディタの補完と静的型チェックが効きます。

ルールは Godot では実行されません。GS2 のリアルタイムルールコンパイラ（`gs2-realtime-compiler`）が、次の 2 つに変換します。

- サーバーで動く GSL（`package.zip` の `main.gsl`）
- ゲームが使うクラス
  - schema のアクセサと `.realtimeschema`
  - 入力・アクション・エラーの定数
  - 予測のコード

## 例

```gdscript
class_name TickRoom
extends Gs2RoomRules

const STATE := TickState
const RESULT := TickResult
const ERROR := TickError


class TickState extends Gs2Record:
	var steps: int


class TickResult extends Gs2Record:
	var finished: bool


enum TickError { INVALID_OPERATION = 5 }

## @room_schema(5)
enum Character { X = 0, Y = 1, LAST_TICK = 2 }

## @room_input
enum TickInput {
	## @input_range(-1, 1)
	MOVE_X = 0,
}


static func start() -> Gs2Step:
	Gs2Room.define_tick_rate(30)
	Gs2Room.define_simulated_prefab(Character)
	return Gs2Step.wait_for(on_tick, TickState.new({steps = 0}))


static func on_tick(state: TickState, tick: int) -> Gs2Step:
	for i in range(Gs2Room.object_count(Character)):
		_move(Gs2Room.object_at(Character, i), tick)
	return Gs2Step.stay(state.with({steps = state.steps + 1}))


## @predict(Character)
static func _move(id: int, step: int) -> void:
	Gs2Room.set_field(id, Character.X, Gs2RoomMath.clamp(Gs2Room.get_field(id, Character.X) + Gs2Room.input(id, TickInput.MOVE_X) * 10, -1000, 1000))
	Gs2Room.set_field(id, Character.LAST_TICK, step)
```

## 構成

| 要素 | 書き方 |
|---|---|
| ルール | `class_name <名前>`、`extends Gs2RoomRules`。1 つのスクリプトに 1 つ |
| 状態・結果・エラー | `const STATE := <レコード>`、`const RESULT := <レコード>`、`const ERROR := <enum>` |
| レコード | `class <名前> extends Gs2Record:` に型付きのフィールド（`var steps: int`）だけを書く。値を書き換えることはできない。`<名前>.new({field = value, ...})` で全フィールドを指定して作り、`record.with({field = value})` でコピーする |
| 開始 | `static func start() -> Gs2Step` |
| ハンドラ | `static func on_interact(state, object_id: int, method: int)`、`on_timer(state, object_id: int, event_id: int)`、`on_tick(state, tick: int)`、`on_spawned(state, object_id: int)`。引数名はルームが渡す名前なので、変えられない（使わない引数は `_object_id` のように `_` を付けてよい） |
| ヘルパー | `static func _name(...)`（非公開）。値を返すか `-> void` |
| 定数 | `const NAME := 3`（int） |

関数はすべて `static` にし、戻り値と引数に型を付けます。

使える型は次のとおりです。
- `int`（ルームでは int32 として計算し、範囲を超えるとその処理全体が失敗する）
- `bool`、`String`、レコード、enum

`float` は、float のフィールドに書く定数（`Gs2Room.set_float`）と、タグの引数にだけ使えます。

## Step（ハンドラが返すもの）

| GDScript | 意味 |
|---|---|
| `Gs2Step.wait_for(on_tick, state)` | 新しいタスクでハンドラのイベントを待つ |
| `.or_wait_for(on_timer)` | 同時にほかのハンドラも待つ |
| `Gs2Step.next(_claim, state)` | 同じイベントの中で、続けて関数を実行する |
| `Gs2Step.stay(state)` | 今のタスクのまま状態を更新する |
| `Gs2Step.end(result[, state])` | ルールを終える |
| `Gs2Step.ignore(TickError.MEMBER)` | イベントを拒否する（行った変更はすべて取り消される） |

ハンドラは名前の文字列ではなく、関数そのもの（`on_tick`）で指定します。

## room enum とタグ

C# の属性の代わりに、`##` の行に**タグを 1 つずつ**書きます。知らないタグや、置く場所を間違えたタグはエラーになります。

| タグ | 書く場所 | 意味 |
|---|---|---|
| `## @room_schema(7, standard=POSITION, position_precision=0.5, rotation_precision=...)` | enum | プレハブ 7 のフィールド（スロット 0..31）。`standard=` は `POSITION` / `ROTATION` / `TRANSFORM` |
| `## @field(int\|bool\|float, precision=0.5, default=1.5)` | schema のメンバー | フィールドの型・精度・初期値 |
| `## @room_input` | enum | 入力のスロット |
| `## @input_range(-1, 1)` | 入力のメンバー | ルールが読むときにこの範囲に丸める |
| `## @room_action` | enum | interact のメソッドやルームイベントの番号 |
| `## @room_timer` | enum | `Gs2Room.after` のイベント番号（1 以上） |
| `## @predict(Character)` | 関数 | クライアントがこの関数で予測する（`static func _name(id: int[, tick: int]) -> void`） |

## Gs2Room

C# の `Room` と同じ API です。GDScript にはジェネリクスとオーバーロードがないので、次の規則で書き分けます。

- **schema を指定する形:** C# の型引数の代わりに、schema の enum を最初の引数に渡します。
  - 例: `Gs2Room.define_simulated_prefab(Character)` は C# の `Room.DefineSimulatedPrefab<Character>()`
  - 例: `Gs2Room.spawn(Crate, x, y)`
- **数値の prefab ID を渡す形:** 名前の末尾に `_raw` を付けます。
  - 例: `define_server_prefab_raw(30, 1991)`、`spawn_raw(30, 0, 0, 0)`
- **フィールドの読み書き:** `get_field` / `set_field` は、schema のメンバー（`Character.X`）でも数値のスロットでも指定できます。bool は `get_bool` / `set_bool`、float の定数は `set_float` で書きます。
- **標準フィールド:** `get_standard` / `set_standard` / `set_standard_float` を使い、`Gs2RoomSync.StandardField.ROTATION_Y` のように指定します。
- **2D:** z を省いて `spawn(S, x, y)` と書けます。当たり判定は `raycast_2d` / `overlap_2d` を使います。

ほかの関数は C# と同じで、名前を snake_case にしたものです。

- 入力: `input` / `input_clamped`
- オブジェクト: `object_count` / `object_at`、`is_prefab` / `prefab_of` / `owner_of` / `exists` / `find_owned`、`despawn`
- タイマー: `after` / `cancel_timer`
- 送り手: `sender_connection_id` / `sender_user_id`
- 定義: `define_hitbox` / `define_relevance`

`Gs2RoomMath` には次の関数があります。
- `clamp` / `abs` / `sign` / `sqrt` / `length2` / `length3` / `mul_div`
- 定数 `INT32_MIN` / `INT32_MAX`

`mini` / `maxi` も使えます。

## 名前

ルールの名前は、決まった規則で C# のルールの名前（GSL や生成物の名前）に写されます。規則に合わない名前はエラーになります。

| GDScript | GSL での名前 |
|---|---|
| `start`、`on_tick`、`_move` | `Start`、`Tick`、`Move` |
| 引数・ローカル `object_id`（`_object_id`） | `objectId` |
| レコードのフィールド `box_id` | `BoxId` |
| enum のメンバー `LAST_TICK` | `LastTick` |
| クラスと enum | そのまま（PascalCase） |

エラーメッセージは、GDScript の書き方と名前で表示されます（`on_interact(<state>, object_id: int, method: int)` など）。

## 書ける構文

- `var x: int = ...` / `var x := ...`
- `const`
- `if` / `elif` / `else`、`while`
- `for i in range(...)`（end は 1 回だけ評価される）
- `match`（定数のパターンと `_`）
- `return` / `pass` / `break` / `continue`
- 演算子: 算術（`+ - * / %`）、比較、`and` / `or` / `not`、`a if c else b`
- `@warning_ignore("...")`

**書けないもの**（位置付きのエラーになる）
- 配列、辞書（レコードの `new` / `with` の引数を除く）、添字
- `self`、`await`、ラムダ、シグナル、`in` / `is` / `as`
- ビット演算、`**`
- float の計算
- 型付きコレクション

整数の割り算には GDScript の `integer_division` の警告が出ます。ルールのディレクトリでこの警告を無効にするか、文の前に `@warning_ignore("integer_division")` を書いてください（関数に付けても本体には効きません）。

## ビルドと登録

1. **コンパイラを入手する。** [リリース](https://github.com/gs2io/gs2-sdk-for-godot/releases) から、OS に合った `gs2-realtime-compiler` を入手します。
2. **コンパイラの場所を設定する。** エディタ設定の `gs2/realtime/compiler_path` に、その場所を設定します。
3. **ビルドする。** **プロジェクト > ツール > GS2 > Build Realtime Rules** を実行します。
   - ルールが 1 つなら、次のプロジェクト設定を使います。既定の場所でよければ、設定は要りません。

     | 設定 | 意味 | 既定 |
     |---|---|---|
     | `gs2/realtime/rules_directory` | ルールのスクリプトを置く場所 | `res://rules` |
     | `gs2/realtime/generated_directory` | ゲームが使うクラスの出力先 | `res://generated/realtime` |
     | `gs2/realtime/package_directory` | サーバーに登録する `package.zip` の出力先 | `res://../build/realtime` |

   - ルールの場所 1 つには、ルールのスクリプトを 1 つだけ置きます。ルールが複数あるときは、ルールごとに場所を分け、プロジェクト設定の `gs2/realtime/rule_sets` に組を並べます。
     - 1 つの組は `{"rules": ..., "generated": ..., "package": ...}` で、意味は上の 3 つの設定と同じです。
     - `rule_sets` が空でなければ、上の 3 つの設定は使いません。
     - `generated` は組ごとに別の場所にしてください。
   - ゲームが使うクラスについて:
     - 生成されなくなったファイルは消えます。
     - 変わらないファイルの `.uid` は残るので、シーンからの参照は壊れません。
   - `package.zip` はゲームの一部ではありません。
   - 生成するクラスの `class_name` はプロジェクト全体で共通です。そのため、ほかの組の生成物や、プロジェクトのほかのスクリプトと名前が重なる組は書き出さず、エラーにします。大文字と小文字の違いだけの名前も重なりとみなします。
     - たとえば、2 つのルールのどちらにも `enum PlayerState` があると、どちらも `PlayerStateSchema` を生成するので重なります。
     - 重なったときは、どちらかの enum の名前を変えてください。
4. **登録する。** `package.zip` の `main.gsl` を、GS2-StateMachine の `UpdateStateMachineMaster` に登録します。
   - `MainStateMachineName` にはルールの `class_name` を指定します。
   - GS2-Realtime のネームスペースの `stateMachineSetting` には、そのバージョンを指定します。
5. **予測を有効にする。** 予測を使うときは、ゲームの起動時に `<Rules>Prediction.register(world)` を呼びます。

コマンドラインからもビルドできます。

```sh
gs2-realtime-compiler --build path/to/rules --output path/to/build
```

ルールのスクリプトは `class_name` を持つので、プロジェクトの中に置いておくとエディタの型チェックが効きます。ただし、ゲームの実行には使わないため、エクスポートのフィルターで除外してください。

# GS2-Realtime object synchronization sample (not part of the addon).
#
# The common part of the Realtime samples (Unity's Shared/RealtimeSyncSample.cs): connects the
# scene's Gs2NetworkSession to a room, keeps the panel with the room's address, the connection
# buttons, the sample's own buttons and the room's objects, and tells the sample when the room
# is ready, objects come and go and the connection ends.
#
# The room's address (the access token of the logged-in player and the room's IP address, port
# and encryption key, from GS2-Realtime) is never part of the scene: fill in the panel, set the
# exported fields in the Inspector (kept out of version control), or pass them after `--` on
# the command line:
#     godot --path . res://samples/realtime/object_sync/object_sync.tscn -- \
#         --gs2-access-token=... --gs2-ip-address=... --gs2-port=... --gs2-encryption-key=...
# With all four given on the command line the sample connects at once. Like the Unity samples,
# the panel can also fetch them from a bootstrap URL that answers with
# {"accessToken": ..., "ipAddress": ..., "port": ..., "encryptionKey": ...} (the local room
# server of the GS2-Realtime samples serves one at http://127.0.0.1:18080/bootstrap).
#
# The scene holds the World (Gs2NetworkWorld) and the Session (Gs2NetworkSession) as children
# of the node with this script.
extends Node


## The logged-in player's access token (GS2-Auth).
@export var access_token := ""
## The room's address, from GS2-Realtime (Room.ip_address / port / encryption_key).
@export var ip_address := ""
@export var port := 0
@export var encryption_key := ""
## Where Fetch reads the address from (optional; see above).
@export var bootstrap_url := ""
## Connects when the scene starts, when the address is filled in.
@export var connect_on_ready := false

## The scene's world and session.
var world: Gs2NetworkWorld
var session: Gs2NetworkSession
## The connection's state as the panel shows it ("Connected", the reason it ended, ...).
var state_text := "Disconnected"
## The latest request's outcome, as the panel shows it.
var request_text := ""

var _token_edit: LineEdit
var _address_edit: LineEdit
var _port_edit: SpinBox
var _key_edit: LineEdit
var _bootstrap_edit: LineEdit
var _bootstrap: HTTPRequest
var _status_label: Label
var _objects_label: Label
var _actions: VBoxContainer
var _next_status := 0.0


func _ready() -> void:
    world = get_node("World")
    session = get_node("Session")
    _read_command_line()
    world.spawned.connect(_on_spawned)
    world.despawned.connect(_on_despawned)
    world.command_rejected.connect(func(rejection: Gs2SyncRejection) -> void: request_text = "Rejected: %s" % rejection)
    session.attached.connect(func(client: Gs2SyncClient) -> void: state_text = "Waiting for snapshot (connection %d)" % client.connection_id)
    session.room_ready.connect(_on_session_ready)
    session.disconnected.connect(_on_session_disconnected)
    _build_panel()
    _add_actions()
    if connect_on_ready:
        connect_room()


func _process(_delta: float) -> void:
    if room_ready():
        _update_room()
    var now := Time.get_ticks_msec() / 1000.0
    if now >= _next_status:
        _next_status = now + 0.2
        refresh_status()


# ---- What the samples provide ----

## Adds the sample's buttons with add_action.
func _add_actions() -> void:
    pass


## The room's snapshot is applied (also after a reconnection).
func _on_room_ready() -> void:
    pass


## Each frame while the room is ready (Unity's UpdateRoom).
func _update_room() -> void:
    pass


## An instance was bound to a room object.
func _on_spawned(_entity: Gs2NetworkEntity) -> void:
    pass


## A room object is going away (also when the connection ends).
func _on_despawned(_entity: Gs2NetworkEntity) -> void:
    pass


## The connection ended: forget the room's objects.
func _on_room_cleared() -> void:
    pass


## More about an object for the panel (" door=open").
func _describe(_o: Gs2NetworkObject) -> String:
    return ""


## A line about the sample's own state for the panel.
func _status() -> String:
    return ""


# ---- Connection ----

## Connects to the room of the address in the panel. False when the address is incomplete or
## the session refuses it (the panel says why).
func connect_room() -> bool:
    access_token = _token_edit.text.strip_edges()
    ip_address = _address_edit.text.strip_edges()
    port = int(_port_edit.value)
    encryption_key = _key_edit.text.strip_edges()
    if access_token == "" or ip_address == "" or port <= 0 or encryption_key == "":
        state_text = "Fill in the access token, IP address, port and encryption key"
        return false
    if session.state != Gs2NetworkSession.State.DISCONNECTED:
        session.disconnect_room()
    if not session.connect_room(access_token, ip_address, port, encryption_key):
        state_text = "Cannot connect: " + session.last_error
        return false
    state_text = "Connecting"
    return true


func disconnect_room() -> void:
    session.disconnect_room()


## Reads the address from the bootstrap URL into the panel, then connects.
func fetch_address() -> void:
    var url := _bootstrap_edit.text.strip_edges()
    if url == "":
        state_text = "Fill in the bootstrap URL"
        return
    if _bootstrap == null:
        _bootstrap = HTTPRequest.new()
        _bootstrap.request_completed.connect(_on_bootstrap_completed)
        add_child(_bootstrap)
    _bootstrap.cancel_request()
    if _bootstrap.request(url) != OK:
        state_text = "Cannot fetch " + url
        return
    state_text = "Fetching the address"


func _on_bootstrap_completed(result: int, code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
    var data: Variant = JSON.parse_string(body.get_string_from_utf8()) if result == HTTPRequest.RESULT_SUCCESS and code == 200 else null
    if typeof(data) != TYPE_DICTIONARY:
        state_text = "Bootstrap failed (result %d, HTTP %d)" % [result, code]
        return
    var address: Dictionary = data
    _token_edit.text = str(address.get("accessToken", ""))
    _address_edit.text = str(address.get("ipAddress", ""))
    _port_edit.value = int(address.get("port", 0))
    _key_edit.text = str(address.get("encryptionKey", ""))
    connect_room()


## True while the room is ready: its snapshot is applied and this client may spawn and send.
## Without a session (the offline tests attach the world themselves) the world's client says.
func room_ready() -> bool:
    if session.state == Gs2NetworkSession.State.READY:
        return true
    return world.client != null and world.client.room_ready


func _on_session_ready() -> void:
    state_text = "Connected"
    _on_room_ready()


func _on_session_disconnected(reason: String) -> void:
    state_text = reason if reason != "" else "Disconnected"
    _on_room_cleared()


func _read_command_line() -> void:
    var given := 0
    for argument in OS.get_cmdline_user_args():
        var pair := argument.split("=", true, 1)
        if pair.size() != 2:
            continue
        match pair[0]:
            "--gs2-access-token":
                access_token = pair[1]
                given += 1
            "--gs2-ip-address":
                ip_address = pair[1]
                given += 1
            "--gs2-port":
                port = int(pair[1])
                given += 1
            "--gs2-encryption-key":
                encryption_key = pair[1]
                given += 1
    if given == 4:
        connect_on_ready = true


# ---- Requests ----

## Shows what became of a request on the panel once it completes.
func track(request: Gs2NetworkRequest, label: String) -> void:
    if request == null:
        request_text = label + ": not sent"
        return
    request_text = label + ": waiting"
    request.on_completed(func(done: Gs2NetworkRequest) -> void: request_text = label + ": " + outcome(done))


## A completed request's outcome ("SUCCEEDED SUCCESS", "REFUSED LEASE_BUSY", ...).
static func outcome(request: Gs2NetworkRequest) -> String:
    var text := String(Gs2SyncTypes.RequestStatus.find_key(request.status))
    var result := 0
    if request is Gs2CommandRequest:
        result = (request as Gs2CommandRequest).result
    elif request is Gs2ControlRequest:
        result = (request as Gs2ControlRequest).result
    else:
        return text
    return text + " " + Gs2SyncTypes.result_name(result)


# ---- The panel ----

## Adds a button that calls action.
func add_action(text: String, action: Callable) -> Button:
    var button := Button.new()
    button.text = text
    button.pressed.connect(action)
    _actions.add_child(button)
    return button


## Updates the panel: the connection, the sample's state, the latest request and the room's
## objects (positions in the wire's units).
func refresh_status() -> void:
    var connection := world.client.connection_id if world.client != null else 0
    var lines: Array[String] = ["%s / connection %d" % [state_text, connection]]
    var own := _status()
    if own != "":
        lines.append(own)
    if request_text != "":
        lines.append(request_text)
    _status_label.text = "\n".join(lines)
    var objects: Array[String] = []
    if world.client != null:
        for o in world.client.objects():
            var values := o.get_values()
            var text := "#%d prefab=%d owner=%d x=%d y=%d z=%d" % [o.id, o.prefab, o.owner_id, values[0], values[1], values[2]]
            if o.mode != Gs2SyncTypes.ObjectMode.PLAYER:
                text += " mode=%s epoch=%d" % [Gs2SyncTypes.ObjectMode.find_key(o.mode), o.epoch]
            objects.append(text + _describe(o))
    _objects_label.text = "\n".join(objects)


## The text the panel shows (for the tests).
func status_text() -> String:
    return _status_label.text + "\n" + _objects_label.text


func _build_panel() -> void:
    var layer := CanvasLayer.new()
    layer.name = "Panel"
    add_child(layer)
    var scroll := ScrollContainer.new()
    scroll.position = Vector2(8, 8)
    scroll.custom_minimum_size = Vector2(340, 0)
    scroll.size = Vector2(340, 620)
    layer.add_child(scroll)
    var column := VBoxContainer.new()
    column.custom_minimum_size = Vector2(320, 0)
    scroll.add_child(column)
    _token_edit = _field(column, "Access token", access_token, true)
    _address_edit = _field(column, "IP address", ip_address, false)
    _port_edit = SpinBox.new()
    _port_edit.max_value = 65535
    _port_edit.value = port
    _port_edit.prefix = "Port"
    column.add_child(_port_edit)
    _key_edit = _field(column, "Encryption key", encryption_key, true)
    _bootstrap_edit = _field(column, "Bootstrap URL (optional, e.g. http://127.0.0.1:18080/bootstrap)", bootstrap_url, false)
    var row := HBoxContainer.new()
    column.add_child(row)
    var connect_button := Button.new()
    connect_button.text = "Connect"
    connect_button.pressed.connect(func() -> void: connect_room())
    row.add_child(connect_button)
    var disconnect_button := Button.new()
    disconnect_button.text = "Disconnect"
    disconnect_button.pressed.connect(disconnect_room)
    row.add_child(disconnect_button)
    var fetch_button := Button.new()
    fetch_button.text = "Fetch"
    fetch_button.pressed.connect(fetch_address)
    row.add_child(fetch_button)
    _status_label = Label.new()
    _status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    column.add_child(_status_label)
    _actions = VBoxContainer.new()
    column.add_child(_actions)
    _objects_label = Label.new()
    column.add_child(_objects_label)


static func _field(parent: Control, placeholder: String, value: String, secret: bool) -> LineEdit:
    var edit := LineEdit.new()
    edit.placeholder_text = placeholder
    edit.text = value
    edit.secret = secret
    parent.add_child(edit)
    return edit

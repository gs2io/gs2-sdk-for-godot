# GS2-Realtime object synchronization sample (not part of the addon).
#
# The Player prefab's RPC (Unity's SamplePulse): the owner calls
# entity.send_rpc("pulse", Gs2SyncTypes.RpcTarget.ALL, 1.5) and every client, the sender
# included, briefly enlarges that player's cube. The method name binds it (net_rpc_<name>),
# so its ID is Gs2NetworkRpc.id_of("pulse"); list that ID in the object catalog's "methods"
# when the namespace has a catalog (Project > Tools > GS2 > Copy Object Catalog JSON).
extends Node


## Calls received, and the latest caller's connection ID.
var received := 0
var last_sender := 0

## The node to enlarge.
@export var body: NodePath = NodePath("../Body")


func net_rpc_pulse(scale: float, info: Gs2NetworkRpcInfo) -> void:
    received += 1
    last_sender = info.sender
    var node := get_node_or_null(body) as Node3D
    if node == null:
        return
    node.scale = Vector3.ONE * scale
    # Real time, also while the tree is paused (Unity's WaitForSecondsRealtime).
    await get_tree().create_timer(0.3, true, false, true).timeout
    if is_instance_valid(node):
        node.scale = Vector3.ONE

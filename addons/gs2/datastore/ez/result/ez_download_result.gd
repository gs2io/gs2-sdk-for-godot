# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
class_name Gs2DatastoreEzDownloadResult
extends RefCounted


var data = PackedByteArray()


func _init(data_ = PackedByteArray()):
    data = data_
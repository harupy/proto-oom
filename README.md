### TL;DR

This repo is a minimum replication of an issue we encountered in https://github.com/mlflow/mlflow. Related to https://github.com/mlflow/mlflow/issues/9360. We adjusted the package name and folder structure to fix #9360. The error reported in #9360 seems to have been resolved, but we encountered a new error.

### Command to reproduce the error

```
git clone https://github.com/harupy/proto-oom
cd proto-oom
docker build .
```

### Error

```
Traceback (most recent call last):
  File "test.py", line 2, in <module>
    from bar.scalapb_pb2 import *
  File "/bar/scalapb_pb2.py", line 18, in <module>
    DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x11\x62\x61r/scalapb.proto\x12\x0b\x62\x61r.scalapb\x1a google/protobuf/descriptor.proto\"L\n\x0eScalaPbOptions\x12\x14\n\x0cpackage_name\x18\x01 \x01(\t\x12\x14\n\x0c\x66lat_package\x18\x02 \x01(\x08\x12\x0e\n\x06import\x18\x03 \x03(\t\"!\n\x0eMessageOptions\x12\x0f\n\x07\x65xtends\x18\x01 \x03(\t\"\x1c\n\x0c\x46ieldOptions\x12\x0c\n\x04type\x18\x01 \x01(\t:K\n\x07options\x12\x1c.google.protobuf.FileOptions\x18\xfc\x07 \x01(\x0b\x32\x1b.bar.scalapb.ScalaPbOptions:N\n\x07message\x12\x1f.google.protobuf.MessageOptions\x18\xfc\x07 \x01(\x0b\x32\x1b.bar.scalapb.MessageOptions:H\n\x05\x66ield\x12\x1d.google.protobuf.FieldOptions\x18\xfc\x07 \x01(\x0b\x32\x19.bar.scalapb.FieldOptionsB\x1e\n\x1corg.mlflow.scalapb_interface')
TypeError: Couldn't build proto file into descriptor pool: out of memory
```

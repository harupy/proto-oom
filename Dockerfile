
FROM python:3.8

COPY bar/scalapb.proto bar/scalapb.proto
COPY foo/scalapb.proto foo/scalapb.proto
COPY test.py test.py
ARG VERSION="3.19.4"
RUN curl -L https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/protoc-${VERSION}-linux-x86_64.zip -o protoc.zip \
    && unzip protoc.zip -d ./protoc \
    && ./protoc/bin/protoc --version \
    && ./protoc/bin/protoc --python_out=. foo/scalapb.proto bar/scalapb.proto \
    && pip install protobuf \
    && python test.py

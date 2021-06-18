all: download proto

proto-gen-from-docker:
	docker build -t dart-protoc .
	docker run -v $(CURDIR):/workspace dart-protoc proto

proto:
	mkdir -p lib/src/_library
	protoc ./ion/proto/ion/ion.proto -I./ion --dart_out=grpc:./lib/src/_library
	protoc ./ion/proto/sfu/sfu.proto -I./ion --dart_out=grpc:./lib/src/_library
	protoc ./ion/apps/biz/proto/biz.proto -I./ion --dart_out=grpc:./lib/src/_library

	dart format lib/src/_library

download:
	git clone https://github.com/pion/ion -b refactor-business-logic --depth=1

clean:
	rm -rf lib/src/_library

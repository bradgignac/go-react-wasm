GOROOT=$(shell go env GOROOT)
HTML=$(shell find src -name '*.html')
JS=$(shell find src -name '*.js')

all: build

src: $(HTML) $(JS)
	cp $? ./build

# TODO: Add deps on all go sources
build/hello: src/main.go
	GOOS=js GOARCH=wasm go build -o build/hello.wasm src/main.go

build/wasm_exec.js: $(GOROOT)/misc/wasm/wasm_exec.js
	cp $? $@

build: src build/hello build/wasm_exec.js

serve: build
	go run support/serve.go

.PHONY: serve

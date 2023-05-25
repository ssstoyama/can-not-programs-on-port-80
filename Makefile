.PHONY: all
all: build

.PHONY: build
build:
	CGO_ENABLED=0 go build -o serve main.go

.PHONY: package
package:
	docker image build -t serve .

.PHONY: run
run: build package
	docker container run --rm -p 80:80 serve

.PHONY: clean
clean:
	rm serve

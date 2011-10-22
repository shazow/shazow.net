all: build

build:
	composer build index.json

serve: build
	composer serve index.json

deploy: build
	rsync -az -e ssh build/ shazow.net:shazow.net/

clean:
	rm -rf ./build

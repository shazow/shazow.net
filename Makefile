all: build

build:
	composer build index.json

serve:
	composer serve index.json

deploy:
	rsync -az -e ssh build/ shazow.net:shazow.net/

clean:
	rm -rf ./build

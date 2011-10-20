all: build

build:
	composer build index.json
	cp -vr _static/* ./build/

deploy:
	rsync -az -e ssh build/ shazow.net:shazow.net/

clean:
	rm -rf ./build

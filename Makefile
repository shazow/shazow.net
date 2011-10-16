all: build

build:
	composer -b ./build -s _templates/
	cp -vr _static/* ./build/

deploy:
	rsync -az -e ssh build/ shazow.net:shazow.net/

clean:
	rm -rf ./build

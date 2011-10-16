all: build

build:
	composer -b ./build -s _templates/
	cp -vr favicon.ico static ./build

deploy:
	rsync -az -e ssh _site/ shazow.net:shazow.net/

clean:
	rm -rf ./build

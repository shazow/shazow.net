all: build

build:
	./webber/webber.py -b ./build -s _templates/

deploy:
	rsync -az -e ssh _site/ shazow.net:shazow.net/

clean:
	rm -rf ./build

all: build

build:
	blogofile build

deploy:
	rsync -az -e ssh _site/ shazow.net:shazow.net/

clean:
	rm -rf _site

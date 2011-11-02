all: build

index.json: indexer.py _templates/ _everything/
	python indexer.py > index.json

build: index.json
	composer build index.json

serve: index.json
	composer serve index.json

deploy: clean build
	rsync --archive --delete --compress -e ssh build/ shazow.net:shazow.net/composed/

pull:
	git submodule foreach --recursive git pull origin master

clean:
	rm -rf ./build

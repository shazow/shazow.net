all: build

index.json: indexer.py _templates/ _everything/
	python indexer.py > index.json

build: index.json
	composer build index.json

serve: index.json
	composer serve index.json

deploy: clean pull build
	rsync --archive --delete --compress -e ssh build/ shazow.net:shazow.net/composed/

pull:
	git pull
	git submodule foreach git pull
	git submodule update

clean:
	rm -rf ./build

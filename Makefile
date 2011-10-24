all: build

index: index.json indexer.py
	python indexer.py > index.json

build: index
	composer build index.json

serve: build
	composer serve index.json

deploy: build
	rsync -az -e ssh build/ shazow.net:shazow.net/

clean:
	rm -rf ./build

all: build

index.json: indexer.py _templates/ _everything/
	python indexer.py > index.json

build: index.json
	composer build index.json

serve: index.json
	composer serve index.json

deploy: build
	rsync -az -e ssh build/ shazow.net:shazow.net/

clean:
	rm -rf ./build

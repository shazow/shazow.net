all: build

index.json: indexer.py _templates/ _everything/
	python indexer.py > index.json

build: index.json
	composer build index.json

serve: index.json
	composer serve indexer:ShazowIndex

deploy: pull
	composer build indexer:ShazowIndex

pull:
	git submodule foreach --recursive git pull origin master

clean:
	rm -rf ./build

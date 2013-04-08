REQUIREMENTS_FILE=requirements.txt
REQUIREMENTS_OUT=requirements.txt.log


all: requirements build

requirements: $(REQUIREMENTS_OUT)

$(REQUIREMENTS_OUT): $(REQUIREMENTS_FILE)
	pip install -r $(REQUIREMENTS_FILE) | tee -a $(REQUIREMENTS_OUT)


index.json: indexer.py _templates/ _everything/
	python indexer.py > index.json

build: index.json
	composer build index.json

serve: index.json
	composer serve indexer:ShazowIndex

deploy: requirements pull
	composer build indexer:ShazowIndex

pull:
	git submodule foreach --recursive git pull origin master

clean:
	rm -rf ./build

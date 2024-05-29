.PHONY: build
build: css
	hugo

run:
	hugo server

deploy:
	git subtree push --prefix build origin gh-pages

css:
	make -C ./scss

static/css/syntax.css:
	hugo gen chromastyles --style=monokai > $@

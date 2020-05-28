.PHONY: build
build:
	hugo

run:
	hugo server

deploy:
	git subtree push --prefix build origin gh-pages

static/css/syntax.css:
	hugo gen chromastyles --style=monokai > $@

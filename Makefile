.PHONY: build
build:
	hugo

run:
	hugo server

deploy:
	git subtree push --prefix build origin gh-pages

.PHONY: build
build:
	hugo

run:
	hugo server

deploy: build
	git commit build/
	git subtree push --prefix build origin gh-pages

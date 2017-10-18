SCSS_IN=*.scss
CSS_OUT=../static/css/base.css

all: scss

scss: $(CSS_OUT)

$(CSS_OUT): $(SCSS_IN)
	sassc -I ./lib base.scss $(CSS_OUT)

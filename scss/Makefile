SCSS_IN=*.scss
CSS_OUT=../assets/css/base.css

all: scss

scss: $(CSS_OUT)

$(CSS_OUT): $(SCSS_IN)
	mkdir -p $(dir $(CSS_OUT))
	sassc -t compressed -I ./lib base.scss $(CSS_OUT)

require "zurb-foundation"

http_path = "/static"
project_path = "_static/"
css_dir = "static/css"
sass_dir = "../compass/sass"
images_dir = "static/images"
javascripts_dir = "static/js"

# You can select your preferred output style here (can be overridden via the command line):
output_style = :expanded

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false

# Disable deprecation warnings (Foundation 5 bug)
sass_options = {:quiet => true}

# Extra bower components (relative to project_path, seems like)
#add_import_path "../.env/bower/foundation/scss"

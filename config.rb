compass_config do |config|
  # config.output_style = :compact
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'partials'
set :fonts_dir, 'fonts'

activate :directory_indexes

configure :development do
  # activate :livereload
end

configure :build do
  # activate :minify_css
  # activate :minify_javascript
end
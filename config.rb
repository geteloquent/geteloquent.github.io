compass_config do |config|
  config.output_style = :compact
end

activate :automatic_image_sizes

configure :development do
  activate :livereload
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  activate :asset_hash
end

# Asset pipeline
activate :sprockets

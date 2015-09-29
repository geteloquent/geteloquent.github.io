compass_config do |config|
  config.output_style = :compact
end

activate :automatic_image_sizes

configure :development do
  activate :livereload
end

activate :blog do |blog|
  blog.permalink = "blog/{year}/{title}.html"
  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 5
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  activate :asset_hash
  set :relative_links, true
end

# Asset pipeline
activate :sprockets

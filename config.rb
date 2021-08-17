###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

data.workshops.speakers.each do |speaker|
  slug = speaker.full_name.gsub(" ", "-").downcase
  proxy "/workshops/#{slug}/index.html", "/workshops/template.html", locals: {
    speaker: speaker }, ignore: true
end

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def markdown(text)
    return unless text

    Tilt['markdown'].new(context: @app) { text }.render
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
end

activate :asset_hash

activate :images

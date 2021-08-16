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

# activate :asset_hash

# activate :images




configure :development do
  helpers do

    def imgixUrl(path,*params)

      return '/images/' + path
    end
  end
end

configure :build do
  helpers do
    def imgixUrl(path,*params)

      imgixClient = Imgix::Client.new(domain: 'codeland.imgix.net', secure_url_token: 'wcUGdXtR3qh2y82a', auto: 'format')

      case ENV["CONTEXT"]
      when 'production'
        return imgixClient.path(ENV["URL"] + '/images/' + path).to_url(params)
      when 'branch-deploy'
        return imgixClient.path(ENV["DEPLOY_PRIME_URL"] + '/images/' + path).to_url(params)
      when 'deploy-preview'
        return imgixClient.path(ENV["DEPLOY_PRIME_URL"] + '/images/' + path).to_url(params)
      else
        return  path
      end
    end


  end
end
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

helpers do
  def primaryDomain
    # CONTEXT is a read-only env variable provided by netlify. If we're on netlify, we can figure out our
    #   domain via the following env variables.
    #   See more at https://docs.netlify.com/configure-builds/environment-variables/#read-only-variables
    case ENV["CONTEXT"]
      when 'production'
        return ENV["URL"]
      when 'branch-deploy'
        return ENV["DEPLOY_PRIME_URL"]
      when 'deploy-preview'
        return ENV["DEPLOY_PRIME_URL"]
      else
        # If we're NOT on netlify, either use DOMAIN or just return empty string
        if ENV["DOMAIN"]
          return ENV["DOMAIN"]
        else
          return ''
        end
    end
  end

  def imgixUrl(path,params={})

    defaultParams = {auto: 'compress,format'}

    params.merge!(defaultParams)

    if !ENV["IMGIX_DOMAIN"] || !ENV["IMGIX_TOKEN"]
      return image_path(path)
    end

    imgixClient = Imgix::Client.new(domain: ENV["IMGIX_DOMAIN"], secure_url_token: ENV["IMGIX_TOKEN"])

    domain = primaryDomain()

    if domain
      return imgixClient.path(domain + image_path(path)).to_url(params)
    elsif ENV["IMGIX_SOURCE_DOMAIN"]
      return imgixClient.path(ENV["IMGIX_SOURCE_DOMAIN"] + image_path(path)).to_url(params)
    else
      return image_path(path)
    end
  end
end

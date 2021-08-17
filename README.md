[![Deploy](https://github.com/code-newbies/codeland/actions/workflows/deploy.yml/badge.svg)](https://github.com/code-newbies/codeland/actions/workflows/deploy.yml)

## CodeLand!

This is a [Middleman](https://middlemanapp.com/) staticly-generated site. It is Ruby based with `erb` syntax and conventions familiar to Ruby on Rails developers.

### Getting Started

```bash
git clone git@github.com:code-newbies/codeland.git
cd codeland
```

```ruby
# Install the dependencies
bundle install

# Start the server locally (development mode)
bundle exec middleman server

# Build the site
bundle exec middleman build
```

For more info, visit the [Middleman docs](https://middlemanapp.com/basics/install/)

### Where to find stuff

All files to modify are located in the `source` directory. These are the basis for the generated files which live in the project root.

Within the source directory are various pages, partials, and assets which are compiled to their static production versions.

### imgix images

This site uses [imgix](imgix.com) for image optimization/transformations. There is a helper called `imgixUrl` that makes use of the [`imgix-rb`](https://github.com/imgix/imgix-rb) gem. In local development, the original image will be served without transformations/optimizations. Sample usage in templates:

```erb
<img
  src="<%= imgixUrl('image.png', {w: 365, h: 365, crop: 'faces,center', fit: 'crop'}) %>"
  alt="meaningful alt text"
>
```

### Deploy to GitHub Pages

We use the gem [middleman-gh-pages](https://github.com/edgecase/middleman-gh-pages) to deploy to GitHub pages. This gem builds and pushes the site to the branch `gh-pages` which will automatically update the live site: [https://codelandconf.com](https://codelandconf.com).

A [GitHub Action](https://github.com/code-newbies/codeland/blob/master/.github/workflows/deploy.yml) will take care of deploying on each commit to `master`. If you ever want to manually deploy use `bundle exec rake publish`. More details can be found in the [docs](https://github.com/edgecase/middleman-gh-pages#usage).

## License

This repo uses the MIT license.

All uses of the CodeLand logo, DEV logo, related imagery, brand slogans, iconography, and the like, may only be used with express permission from Dev Community Inc. ("DEV"). DEV reserves all rights, even if certain assets are included in DEV open source projects. Please contact yo@dev.to with any questions or to request permission.

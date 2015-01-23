require 'bundler'
Bundler.require(:default)

require 'sinatra/base'
require 'sinatra/asset_pipeline'

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "app/views") }
  set :logging, true

  # in development, serve individual files
  configure :test, :development do
    Sprockets::Helpers.configure do |config|
      config.debug = true
    end
  end

  # Include these files when precompiling assets
  set :assets_precompile, %w(application.sass application.coffee)

  # Logical paths to your assets
  set :assets_prefix, %w(app/assets vendor/assets)

  # integrate Sprockets
  register Sinatra::AssetPipeline

  get '/' do
    haml :application
  end

end

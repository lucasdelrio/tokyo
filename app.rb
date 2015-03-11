require 'bundler'
Bundler.require(:default, "development") # XXX this should depend on ENV["RACK_ENV"]

require 'sinatra/base'
require 'sinatra/asset_pipeline'

class App < Sinatra::Base

  enable :sessions

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

  # Integrate Sprockets
  register Sinatra::AssetPipeline

  # Actual Rails Assets integration, everything else is Sprockets
  if defined?(RailsAssets)
    RailsAssets.load_paths.each do |path|
      settings.sprockets.append_path(path)
    end
  end

  # Templating helpers
  register Sinatra::Partial

  # Partial template engine
  set :partial_template_engine, :haml

  # Use same Rails convention
  enable :partial_underscores

  get '/' do
    unless user_id = request.cookies["user_id"]
      user = User.create
      response.set_cookie "user_id", value: user.id, expires: Time.now + 86400 # 1 day cookie
      user_id = user.id
    end

    session["user_id"] = user_id

    haml :'outgoings/form', layout: :application
  end

  get '/groups' do
    haml :'groups/groups', layout: :application
  end

  get '/grid' do
    haml :'grid/grid', layout: :application
  end

  helpers do
    def app_config
      {
        userId: session["user_id"].to_i
      }
    end
  end
end

class User # XXX to be replaces by an activerecord
  def self.create
    return new
  end

  def id
    rand(100)
  end
end

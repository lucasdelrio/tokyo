# $:.unshift File.expand_path("../", __FILE__)

require 'bundler'
Bundler.require(:default)

require './app'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  # environment.js_compressor = Uglifier.new(:copyright => false)
  # environment.css_compressor = YUI::CssCompressor.new
  run environment
end

map '/' do
  run App
end

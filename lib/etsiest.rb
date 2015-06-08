require "etsiest/version"
require 'sinatra/base'
require 'pry'
require 'etsy'

Etsy.api_key = ENV['ETSY_KEY']

module Etsiest
  class EtsySearch < Sinatra::Base
get '/etsy_search'  do
  @results = Etsy::Request.get('/listings/active', 
    :includes => ['Images', 'Shop'], 
    :keywords => 'furniture',
    :limit => 25,
    :offset =>  25)
  erb :index

  run! if app_file == $0
  end
end

# set :library, Etsiest.new(song_path). 

# Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey')
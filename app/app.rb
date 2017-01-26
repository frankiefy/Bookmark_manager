ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect 'links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect 'links'
  end

=begin
this was just an attempt, not required yet
  get '/links/delete' do
    erb :'links/delete'
  end

  post '/links/to_delete' do
    to_delete = Link.get(title: params[:title])
    to_delete.destroy
    #Link.destroy(title: params[:title])
    redirect 'links'
  end
=end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

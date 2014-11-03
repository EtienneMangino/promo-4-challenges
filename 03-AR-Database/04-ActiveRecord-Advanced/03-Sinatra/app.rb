require 'sinatra'
require "sinatra/reloader" if development?
require_relative "config/application.rb"

set :views, proc { File.join(root, "app/views") }





get '/' do
  # TODO: fetch posts from database.
  #       to pass them to the view, store them in an instance variable
  @posts = Post.all

  erb :posts  # The rendered HTML is in app/views/posts.erb
end

post '/' do
  @post = Post.new(name: params[:name], url: params[:url])
  if @post.valid?
    @post.save
    redirect "/"
  else
    erb  :post
    # redirect "/"
  end
end

post '/vote' do
  post = Post.find(params[:id])
  post.votes += 1
  post.save
  redirect "/"
end

get '/delete' do
  post = Post.find(params[:id])
  post.destroy
  redirect "/"
end
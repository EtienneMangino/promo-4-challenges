require_relative "../config/application"
require_relative "../app/models/post"
require "json"
require "rest-client"

# TODO: Write a seed to insert 100 posts in the database fetched from the Hacker News API.

ids = JSON.parse(RestClient.get 'https://hacker-news.firebaseio.com/v0/topstories.json')

ids[0..9].each do |element|
  hacker_post = JSON.parse(RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{element}.json")
  post = Post.new(
      name: hacker_post["title"],
      url: hacker_post["url"],
      votes: hacker_post["score"])
  post.save
end
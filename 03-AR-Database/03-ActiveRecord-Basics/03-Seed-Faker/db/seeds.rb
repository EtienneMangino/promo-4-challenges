require_relative "../config/application"
require_relative "../app/models/post"
require 'active_record'
require 'sqlite3'
require 'yaml'

require "faker"

# TODO: Write a seed to insert 100 posts in the database
100.times do
  post = Post.new(
      name: Faker::Name.name,
      url: Faker::Internet.url,
      votes: (0..20).to_a.sample)
  post.save
end
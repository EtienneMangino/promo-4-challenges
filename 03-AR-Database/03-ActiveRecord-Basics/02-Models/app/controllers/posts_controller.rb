require_relative "../views/post_view.rb"

class PostsController
  def initialize
    @view = PostView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    posts = Post.all
    @view.list_all_posts(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    name = @view.ask_for_name
    url = @view.ask_for_url
    new_post = Post.new(name: name, url: url)
    new_post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    index
    id = @view.ask_for_id
    post_to_update = Post.find(id)
    post_to_update.name = @view.ask_for_name
    post_to_update.url = @view.ask_for_url
    post_to_update.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    index
    id = @view.ask_for_id
    post_to_delete = Post.find(id)
    post_to_delete.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    index
    id = @view.ask_for_id
    post_to_upvote = Post.find(id)
    post_to_upvote.votes += 1
    post_to_upvote.save
  end
end
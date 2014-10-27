class PostsController
  def initialize
    @view = PostView.new
  end

  ################################################################
  # BEWARE: you MUST not use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    tab = Post.all
    @view.list_all_post(tab)
  end

  def create
    # TODO: implement creating a new post
    info_for_post = {}
    info_for_post[:title] = @view.ask_for_title
    info_for_post[:url] = @view.ask_for_url

    post = Post.new(info_for_post)
    post.save
  end

  def update
    # TODO: implement updating an existing post
    index
    id = @view.ask_for_id
    return if id.nil?
    post = Post.find(id)
    return puts "Mauvais Id" if post.nil?
    post.title = @view.ask_for_title
    post.url = @view.ask_for_url
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    index
    id = @view.ask_for_id
    return if id.nil?
    post = Post.find(id)
    return puts "Mauvais Id" if post.nil?
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    id = @view.ask_for_id
    return if id.nil?
    post = Post.find(id)
    return puts "Mauvais Id" if post.nil?
    post.upvote
    post.save
  end

  def verifier_id(id)

  end
end
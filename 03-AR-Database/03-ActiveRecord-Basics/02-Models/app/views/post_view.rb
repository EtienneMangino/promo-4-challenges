class PostView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def list_all_posts(posts)
    posts.each do |post|
      puts "id : #{post.id} name : #{post.name}, url : #{post.url}, votes : #{post.votes}"
    end
  end

  def ask_for_name
    puts "What name ?"
    gets.chomp
  end


  def ask_for_url
    puts "What url ?"
    gets.chomp
  end

  def ask_for_id
    puts "What id ?"
    Integer(gets.chomp)
  end

end
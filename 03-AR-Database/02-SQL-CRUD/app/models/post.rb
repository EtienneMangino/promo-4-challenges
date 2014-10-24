# You can use a global variable, DB, built as is:
# DB = SQLite3::Database.new(file)

class Post
  # TODO: implement some reader and/or writers
  attr_reader :date, :votes, :id
  attr_accessor :title, :url
  def initialize(options = { title: title, url: url, id: id, date: date, votes: votes })
    # TODO: initialize instance variables from the hash options.
    options[:date].nil? ? @date =  Time.now : @date =  options[:date]
    @title = options[:title]
    @url = options[:url]
    options[:votes].nil? ? @votes = 0 : @votes = options[:votes]
    @id = options[:id]
  end


  # TODO: implement all the class methods and instance methods
  #       to have a full CRUD support on your Post model
  def save
    if @id.nil?
      instruction = "INSERT INTO posts(title, url, date, votes)
      VALUES ('#{@title}', '#{@url}', #{@date.to_i}, #{@votes}) ;"
      DB.execute(instruction)
      @id = DB.last_insert_row_id
    else
      instruction = "UPDATE posts SET title = '#{@title}', url = '#{@url}', votes ='#{@votes}' WHERE id = #{@id};"
      DB.execute(instruction)
    end
  end

  def self.all
    instruction = "SELECT * FROM posts;"
    tab = DB.execute(instruction)
    tab.each { |x| x[3] = Time.at(x[3]) }
    tab.map { |p| Post.new(title: p[1], url: p[2], date: Time.at(p[3]), votes: p[4], id: p[0]) }
  end

  def self.find(index)
    instruction = "SELECT * FROM posts WHERE id = #{index};"
    tab = DB.execute(instruction)
    tab = tab[0]
    if tab.nil?
      nil
    else
      Post.new(title: tab[1], url: tab[2], date: Time.at(tab[3]), votes: tab[4], id: tab[0])
    end
  end

  def destroy
    instruction = "DELETE FROM posts WHERE id = #{@id};"
    DB.execute(instruction)
  end

  def upvote
    @votes += 1
  end
end


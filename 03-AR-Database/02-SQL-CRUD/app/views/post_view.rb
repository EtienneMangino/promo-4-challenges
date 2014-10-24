class PostView
  # TODO: implement methods called by the PostsController
  def initialize
  end

  def ask_for_title
    puts "Quel est le titre de votre post ?"
    gets.chomp
  end

  def ask_for_url
    puts "Quel est l'url de votre post ?"
    gets.chomp
  end

  def list_all_post(tab)
    tab.each { |p| puts "#{p.id}, title: #{p.title}, url: #{p.url}, date: #{p.date}, votes: #{p.votes}" }
  end

  def ask_for_id
    puts "Quel post voulez vous (choisir l'id) ?"
    gets.chomp.to_i
  end
end
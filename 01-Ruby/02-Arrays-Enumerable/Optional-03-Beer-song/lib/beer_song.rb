def beer_song(beer_start_count)
  # TODO: sing the song
  i = beer_start_count.to_i

  if i == 1
    puts "1 bottle of beer on the wall, 1 bottle of beer!\nTake one down, pass it around, no more bottles of beer on the wall!"
  else

    puts "#{i} bottles of beer on the wall, #{i} bottles of beer!\n"
    i -= 1
    while i > 1
      puts "Take one down, pass it around, #{i} bottles of beer on the wall!\n#{i} bottles of beer on the wall, #{i} bottles of beer!"
      i -= 1
    end
    puts "Take one down, pass it around, 1 bottles of beer on the wall!\n1 bottle of beer on the wall, 1 bottle of beer!\nTake one down, pass it around, no more bottles of beer on the wall!"
  end
end



beer_song(ARGV[0])
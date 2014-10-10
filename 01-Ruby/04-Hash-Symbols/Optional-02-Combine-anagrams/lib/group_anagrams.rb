def group_anagrams(words)
  #TODO: group anagrams
  tableau_final = []

  words.each do |x|
    index = nil
    tab_temp = tableau_final.map {|a| a.map {|b| b.downcase.chars.sort.join}}

    tab_temp.each_with_index { |y,i| index = i if y.include?(x.downcase.chars.sort.join)}
      if index.nil?
        tableau_final << [x]
      else
        tableau_final[index] << x
      end
  end
  tableau_final
end

# input:
p group_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]


ROMAN = {
  "I"=> 1,
  "IV"=> 4,
  "V"=> 5,
  "IX"=> 9,
  "X"=> 10,
  "XL"=> 40,
  "L"=> 50,
  "XC"=> 90,
  "C"=> 100,
  "CD"=> 400,
  "D"=> 500,
  "CM"=> 900,
  "M"=> 1000 }


def roman_to_integer(roman_string)
  #TODO: translate roman string to integer
  exception = ["IV","IX","XL","XC","CD","CM"]
  tab_split_exception = roman_string.split(/(IV|IX|XL|XC|CD|CM)/)
  tab_final = []
  somme = 0

  tab_split_exception.reject! { |x| x==""}
  tab_split_exception.each do |x|
    if exception.include?(x)
      tab_final << x
    else
      a = x.split(//)
      a.each {|y| tab_final << y}
    end
  end

  tab_final.each {|x| somme += ROMAN[x]}
  somme
end


# # testing your program
# p roman_to_integer('MCMXLI')  # => true
# puts roman_to_integer('XII') == 12 # => true
# puts roman_to_integer('XIX') == 19 # => true


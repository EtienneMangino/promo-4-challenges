def old_roman_numeral(an_integer)
  # TODO: translate integer in text number - old-style way

  text = ""
  text += "M" * (an_integer / 1000)
  text += "D" * (an_integer % 1000 / 500)
  text += "C" * (an_integer % 500 / 100)
  text += "L" * (an_integer % 100 / 50)
  text += "X" * (an_integer % 50 / 10)
  text += "V" * (an_integer % 10 / 5)
  text += "I" * (an_integer % 5 / 1)
text
end

def new_roman_numeral(an_integer)
  # TODO: translate integer in text number - modern-style way
  text = ""
  text += "M" * (an_integer / 1000)


  if (an_integer % 1000 / 100) == 9
    text += "CM"
  elsif (an_integer % 1000 / 100) >= 5
    text += "D"
    text += "C" * (an_integer % 500 / 100)
  elsif  (an_integer % 1000 / 100 == 4)
    text += "CD"
  else
    text += "C" * (an_integer % 500 / 100)
  end


  if (an_integer % 100 / 10) == 9
    text += "XC"
  elsif (an_integer % 100 / 10) >= 5
    text += "L"
    text += "X" * (an_integer % 50 / 10)
  elsif  an_integer % 100 / 10 == 4
    text += "XL"
  else
    text += "X" * (an_integer % 50 / 10)
  end

  if (an_integer % 10 / 1) == 9
    text += "IX"
  elsif (an_integer % 10 / 1) >= 5
    text += "V"
    text += "I" * (an_integer % 5 / 1)
  elsif  (an_integer % 10 / 1) == 4
    text += "IV"
  else
    text += "I" * (an_integer % 5 / 1)
  end

text
end

puts new_roman_numeral(1454)
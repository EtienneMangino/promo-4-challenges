def old_roman_numeral(an_integer)
  # TODO: translate integer in text number - old-style way

  text = ""
  text += "M" * (an_integer / 1000)
  text += "D" * (an_integer % 1000 / 500)
  text += "C" * (an_integer % 500 / 100)
  text += "L" * (an_integer % 100 / 50)
  text += "X" * (an_integer % 50 / 10)
  text += "V" * (an_integer % 10 / 5)
  text + "I" * (an_integer % 5 / 1)
end


def mal_a_la_tete(an_integer, a, tableau)
  dizieme = a / 10
  moitie = a / 2
  text = ""

  if (an_integer % a / dizieme) == 9
    text += tableau [a / 10 * 9]
  elsif (an_integer % a / dizieme) >= 5
    text += tableau[moitie]
    text += tableau[dizieme] * (an_integer % moitie / dizieme)
  elsif  (an_integer % a / dizieme == 4)
    text += tableau[a / 10 * 4]
  else
    text += tableau [dizieme] * (an_integer % moitie / dizieme)
  end
  text
end

def new_roman_numeral(an_integer)
  # TODO: translate integer in text number - modern-style way
  tableau = (0..1000).to_a
  tableau[1] = "I"
  tableau[4] = "IV"
  tableau[5] =  "V"
  tableau[9] =  "IX"
  tableau[10] = "X"
  tableau[40] = "XL"
  tableau[50] =  "L"
  tableau[90] =  "XC"
  tableau[100] = "C"
  tableau[400] = "CD"
  tableau[500] =  "D"
  tableau[900] =  "CM"
  tableau[1000] =  "M"

  text = ""
  text += "M" * (an_integer / 1000)
  text += mal_a_la_tete(an_integer, 1000, tableau)
  text += mal_a_la_tete(an_integer, 100, tableau)
  text + mal_a_la_tete(an_integer, 10, tableau)
end

puts new_roman_numeral(1454)
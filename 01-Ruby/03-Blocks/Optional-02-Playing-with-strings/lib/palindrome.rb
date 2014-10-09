def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  tab_reject = %w(! , ; . : ! " ' ( ) - )

  if a_string == ""
    false
  else
    tab = a_string.upcase.split("")
    tab.reject! { |x| tab_reject.include?(x) || x == " " }
    print tab
    if tab.size.odd?
      a = tab[0..(tab.size / 2)]
      print a
      b = tab.reverse[0..(tab.size / 2)]
      print b
      a == b
    else
      a = tab[0..(tab.size / 2)]
      b = tab.reverse[0..(tab.size / 2)]
      a == b
    end
  end
end
puts palindrome?("wagon")

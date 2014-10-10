def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  tab_reject = %w(! , ; . : ! " ' ( ) - )

  if a_string == ""
    false
  else
    tab = a_string.upcase.split("")
    tab.reject! { |x| tab_reject.include?(x) || x == " " }
    tab == tab.reverse
  end
end
puts palindrome?("wagon")

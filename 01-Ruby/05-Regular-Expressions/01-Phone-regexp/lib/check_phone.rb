def french_phone_number?(phone_number)
  # TODO: true or false?
  test = phone_number.to_s.gsub(/[\s-]/, "")
  if test =~ /^(0|\+?33)[1-9]\d{8}$/
    true
  else
    false
  end
end

p french_phone_number?("062254 -87411")
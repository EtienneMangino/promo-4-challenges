# Encoding: utf-8

JOKE = {
  "hotmail.fr" => "Génération msn",
  "lewagon.org" => "you're skilled and capable",
  "gmail.com" => "you're an average but modern person",
  "live.com" => "aren't you born before 1973?"
}

JOKE_DEBUT = {
  "hotmail.fr" => "Hey ",
  "lewagon.org" => "Well done ",
  "gmail.com" => "",
  "live.com" => ""
}

def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided
  if email.is_a?(String) == false || email.match(/^(.*)@\w*\..*$/).nil?
    fail ArgumentError
  end

  nom = email.match(/^(.*)@/)
  domaine = email.match(/@(\w*\..*)$/)

  if JOKE.include?(domaine[1])
    "#{JOKE_DEBUT[domaine[1]]}#{nom[1].gsub(/\./, " ")}, #{JOKE[domaine[1]]}"
  else
    "Sorry #{nom[1].gsub(/\./, " ")}, we don't know how to judge '#{domaine[1]}'"
  end
end

p mail_joke("etienne@hotmail.com")
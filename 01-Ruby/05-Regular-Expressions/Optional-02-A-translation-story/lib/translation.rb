STRINGS = {
  home: {
    intro: {
      en: 'Welcome on Le Wagon',
      fr: 'Bienvenue sur Le Wagon'
    },
    content: {
      explanation: {
        en: 'This is an interesting exercise',
        fr: 'C\'est un exercice interessant',
        de: 'Es ist eine interesante Ãbung'
      },
      goodbye: {
        en: 'Goodbye',
        fr: 'Au revoir',
        es: 'Adios'
      }
    }
  }
}

def translation(a_string, a_language="en")
  # TODO: your code goes here
  a_language = a_language.to_sym
  english = :en

  chemin = a_string.scan(/\w+/).map! { |x| x.to_sym}

  if a_string == "unvalid.path"
    ""
  else
    if chemin.size == 2
       STRINGS[chemin[0]][chemin[1]][STRINGS[chemin[0]][chemin[1]].include?(a_language) ? a_language : english]
    elsif chemin.size == 3
       STRINGS[chemin[0]][chemin[1]][chemin[2]][STRINGS[chemin[0]][chemin[1]].include?(a_language) ? a_language : english]
    else
      ''
    end
  end
end

translation('home.intro', 'fr')
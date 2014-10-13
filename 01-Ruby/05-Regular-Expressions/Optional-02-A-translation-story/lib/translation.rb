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

def translation(a_string, a_language = "en")
  # TODO: your code goes here
  a_language = a_language.to_sym
  english = :en

  route = STRINGS
  chemin = a_string.scan(/\w+/).map!(&:to_sym)

  chemin.each do |x|
    route = route[x]
    return "" if route.nil?
  end

  route[route.include?(a_language) ? a_language : english]
end

translation('home.intro', 'fr')
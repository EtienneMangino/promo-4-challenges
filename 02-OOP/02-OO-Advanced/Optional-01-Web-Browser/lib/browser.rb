require 'open-uri'
require 'nokogiri'

class Browser
  def fetch_content(url)
    doc = Nokogiri::HTML(open(url))
    doc.at('body').text
  end
end
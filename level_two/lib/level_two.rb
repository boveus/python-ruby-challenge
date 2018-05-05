require 'nokogiri'
require 'pry'
# Lets scrape it with nokogiri first...

class LevelTwo
  attr_reader :url

  def iniitalize
    @url = Nokogiri::HTML("http://www.pythonchallenge.com/pc/def/ocr.html")
    Nokogiri::HTML(open("index.html"))
  end
end

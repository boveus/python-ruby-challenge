require 'nokogiri'
require 'open-uri'
require 'pry'
# Lets scrape it with nokogiri first...

class LevelTwo
  def url_data
    Nokogiri::HTML(open('http://www.pythonchallenge.com/pc/def/ocr.html'))
  end

  def main_data
    url_data.to_s.split('-->')[-2]
  end
end

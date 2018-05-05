require 'nokogiri'
require 'open-uri'
# Lets scrape it with nokogiri first...

class LevelThree
  def url_data
    Nokogiri::HTML(open('http://www.pythonchallenge.com/pc/def/equality.html'))
  end

  def target_data
    url_data.to_s.split('-->')[-2]
  end

  def matches
    target_data.scan(/[a-z][A-Z][A-Z][A-Z][a-z][A-Z][A-Z][A-Z][a-z]/)
  end

  def parse_link
    link_text = []
    matches.each do |match|
      link_text << match.chars[4]
    end
    link_text.join('')
  end
end

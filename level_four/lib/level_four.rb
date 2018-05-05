require 'nokogiri'
require 'open-uri'
# http://www.pythonchallenge.com/pc/def/linkedlist.php

class LevelFour
  def url_data
    Nokogiri::HTML(open('http://www.pythonchallenge.com/pc/def/linkedlist.php'))
  end

  def first_url
    "http://www.pythonchallenge.com/pc/def/#{url_data.css('a')[0]['href']}"
  end

  def first_nothing
    Nokogiri::HTML(open(first_url)).text.split(' ').last
  end

  def nothing_url(nothing_number)
    "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=#{nothing_number}"
  end

  def get_next(nothing_number = first_nothing)
    next_nothing = Nokogiri::HTML(open(nothing_url(nothing_number))).text.split(' ').last
    if next_nothing.to_i > 40000
      get_next(next_nothing)
    else
      next_nothing
    end
  end

  def matches
  end
end

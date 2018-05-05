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

  def handle_nothing_response(nothing_number)
    next_nothing_response = Nokogiri::HTML(open(nothing_url(nothing_number)))
    next_nothing = next_nothing_response.text.split(' ').last
    next_nothing_message = next_nothing_response.text.split(' ')[0..-2].join(' ')
    return next_nothing, next_nothing_message
  end

  def get_next(nothing_number = first_nothing)
    next_nothing, next_nothing_message = handle_nothing_response(nothing_number)
    if next_nothing_message == 'and the next nothing is'
      get_next(next_nothing)
    elsif next_nothing_message == 'Your hands are getting tired and the next nothing is'
      get_next(next_nothing)
    else
      next_nothing_message + ' ' + next_nothing
    end
  end

  def matches
  end
end

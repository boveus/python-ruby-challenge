require 'nokogiri'
require 'open-uri'
require 'pry'
# http://www.pythonchallenge.com/pc/def/linkedlist.php

class LevelFour
  def initialize
    get_next
  end

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
    if next_nothing.to_i == 16044
      get_next(divide_by_two(next_nothing))
    elsif continue_responses.include?(next_nothing_message)
      get_next(next_nothing)
    else
      puts next_nothing_message + ' ' + next_nothing
    end
  end

  def divide_by_two(nothing)
    (nothing.to_i / 2).to_s
  end

  def continue_responses
    ['and the next nothing is', 'Your hands are getting tired and the next nothing is', 'There maybe misleading numbers in the text. One example is 82683. Look only for the next nothing and the next nothing is']
  end
end

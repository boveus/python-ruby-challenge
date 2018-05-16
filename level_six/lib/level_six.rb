require 'nokogiri'
require 'open-uri'
require 'pry'
require 'zip'
# http://www.pythonchallenge.com/pc/def/channel.html
# http://www.pythonchallenge.com/pc/def/channel.zip


class LevelSix
  def initialize
    open_next
  end

  def first_nothing
    File.read('./level_six/data/channel/90052.txt').split(' ').last
  end

  def open_next(nothing = first_nothing)
    next_nothing, next_message = parse_nothing(nothing)
    puts "#{next_message} #{next_nothing}"
    if next_message == 'Next nothing is'
      open_next(next_nothing)
    end
  end

  def parse_nothing(nothing)
    next_nothing = File.read("./level_six/data/channel/#{nothing}.txt").split(' ').last
    next_message = File.read("./level_six/data/channel/#{nothing}.txt").split(' ')[0..-2].join(' ')
    puts File.open("./level_six/data/channel/#{nothing}.txt")
    binding.pry
    return next_nothing, next_message
  end
# This is gonna get ugly...
#  mdls 270.txt | grep kMDItemFinderComment
# >> kMDItemFinderComment               = "this is my comment"
end

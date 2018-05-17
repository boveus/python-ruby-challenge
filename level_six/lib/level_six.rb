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
    next_nothing, next_message, comment = parse_nothing(nothing)
    print "#{comment}"
    if next_message == 'Next nothing is'
      open_next(next_nothing)
    end
  end

  def parse_file_comment(file_name)
    result = `mdls "#{file_name}" | grep kMDItemFinderComment`
    result.split('=').last
  end

  def parse_nothing(nothing)
    file = "./level_six/data/channel/#{nothing}.txt"
    next_nothing = File.read("#{file}").split(' ').last
    next_message = File.read("#{file}").split(' ')[0..-2].join(' ')
    comment = parse_file_comment(file)
    return next_nothing, next_message, comment
  end
end

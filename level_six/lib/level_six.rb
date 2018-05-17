require 'nokogiri'
require 'open-uri'
require 'pry'
require 'zip/zip'


# http://www.pythonchallenge.com/pc/def/channel.html
# http://www.pythonchallenge.com/pc/def/channel.zip


class LevelSix
  def initialize
    @entries = ''
    open_next
  end

  def first_nothing
    File.read('./level_six/data/channel/90052.txt').split(' ').last
  end

  def print_comment(nothing)
    Zip::ZipFile.open("./level_six/data/channel.zip") do |zipfile|
      @entries += zipfile.get_entry("#{nothing}.txt").comment
    end
  end

  def open_next(nothing = first_nothing)
    next_nothing, next_message = parse_nothing(nothing)
    if next_message == 'Next nothing is'
      print_comment(next_nothing)
      open_next(next_nothing)
    else
      print @entries
    end
  end

  # Wrong type of comments
  # https://stackoverflow.com/questions/1588236/read-file-comments-from-a-zip-file-in-ruby
  # blergh
  def parse_file_comment(file_name)
    result = `mdls "#{file_name}" | grep kMDItemFinderComment`
    return result.split('=').last
  end


  def parse_nothing(nothing)
    file = "./level_six/data/channel/#{nothing}.txt"
    next_nothing = File.read("#{file}").split(' ').last
    next_message = File.read("#{file}").split(' ')[0..-2].join(' ')
    return next_nothing, next_message
  end
end

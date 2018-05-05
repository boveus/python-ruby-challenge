require 'nokogiri'
require 'open-uri'
require 'pry'
require 'unpickle'
# http://www.pythonchallenge.com/pc/def/peak.html

class LevelFive
  def url_data
    Nokogiri::HTML(open('http://www.pythonchallenge.com/pc/def/peak.html'))
  end

  def pickle_file
    file = open('http://www.pythonchallenge.com/pc/def/banner.p').read
    Unpickle.loads(file)
  end

  def create_banner
    instruction_array = []
    pickle_file.each do |nested_array|
      nested_array.each do |instruction|
        instruction_array <<  (instruction[0] * instruction[1].to_i)
      end
    end
    puts instruction_array.join('')
  end
end

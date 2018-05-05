require 'pry'

class LevelOne
   def initialize(input_string)
     input_letters = input_string.chars
     puts transform(input_letters).join('')
   end

   def transform(string_array)
     string_array.map do |letter|
       transform_letter(letter)
     end
   end

   private

   def transform_letter(letter)
     letter.each_byte.map do |byte|
       if byte_is_a_through_x?(byte)
        (byte += 2).chr
       elsif byte_is_y_or_z?(byte)
        (byte - 24).chr
       else
       byte.chr
       end
     end
   end

   def byte_is_a_through_x?(byte)
     byte > 96 && byte < 120
   end

   def byte_is_y_or_z?(byte)
     byte == 121 || byte == 122
   end
end

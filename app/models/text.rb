require_relative '../../lib/words'

class Text
  attr_reader :number_of_paragraphs

  def initialize(number_of_paragraphs = 1)
    @number_of_paragraphs = number_of_paragraphs

    # an array of words
    @words = WORDS
  end

  def sentence
    length = rand(6) + 2
    sentence_array = []
    while sentence_array.length < length
      # text_fragment = "A"
      # while text_fragment[0] == text_fragment[0].upcase
      text_fragment = @words.sample
      # end
      sentence_array << text_fragment if !sentence_array.include?(text_fragment)
    end
    sentence_string = sentence_array.join(" ") + "."
    sentence_string[0] = sentence_string[0].upcase
    sentence_string
  end

  def paragraph
    length = rand(4) + 4
    paragraph_array = []
    while paragraph_array.length < length
      paragraph_array << [sentence]
    end
    paragraph_array.join(" ") + "</br>"
  end

  def paragraphs
    text_block = []
    while text_block.length < @number_of_paragraphs
      text_block << paragraph
    end
    text_block.join("</br>")
  end
end
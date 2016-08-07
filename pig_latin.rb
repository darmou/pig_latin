class PigLatin
  
  @@found_dict = {} #for memoization
  
  #Translate a text string into pig latin from English
  def translate text
    split_arr = text.split(" ")
    split_arr_trans = split_arr.map { |word| 
      (@@found_dict.key? word) ? @@found_dict[word] : (@@found_dict[word]=process_word(word); @@found_dict[word])
    }
    return split_arr_trans.join(" ")
  end
  
  private #oo encapsulation

  #Add any word that starts with a vowel the letters "yay"
  def vowel_trans(word)
    return word + "yay"
  end  
  
  #If a word starts with a constant grab all the constants at the start of the word and add them to the end and add "ay" at the end
  #If the word starts with an upper case ensure the translated word starts with an upper case letter
  def const_trans(word, const_match)
    is_up = (word[0..0].upcase == word[0..0])
    word = word[const_match.to_s.length..-1] + const_match.to_s.downcase + "ay" 
    return (is_up) ? word[0..0].upcase + word[1..-1]: word
  end

  #Check if we need to process a constanant word (starts with constantant) or a vowel word (starts with a vowel)
  def process_word word
    const_match = /^[BCDFGHIJKLMNPQRSTVWXYZbcdfhhtjklmnpqrstvwxyz]+/.match(word)
    letter_match = /^[a-zA-Z]+/.match(word) #Match letters only
    other_chars = word[letter_match.to_s.length..-1]
    if const_match.to_s.length > 0
      return const_trans(letter_match.to_s, const_match) + other_chars
    else
      return vowel_trans(letter_match.to_s) + other_chars 
    end
    
  end
end
module FunWithStrings
  def palindrome?
    word = self.gsub(/[^a-z]/i, '').upcase
    word == word.reverse
  end

  def count_words
    words = Hash.new(0)
    self.downcase
        .gsub(/[^ a-z]/, '')
        .split
        .each {|e| 
          words[e] += 1
        }
    words
  end

  def anagram?(word)
    self.length == word.length and
    self.chars.to_a.all? {|c| word.include? c}
  end

  def contains_anagram? (anagrams)
    !anagrams.empty? and
    anagrams.any? {|words|
      words.any? {|w|
        self.anagram?(w)
      } 
    }
  end

  def add_to_anagrams(anagrams, word)
    if !word.contains_anagram?(anagrams)
      anagrams.push([word])
    else
      anagrams.each {|words| words.push word if word.anagram?(words[0])}
    end
    anagrams
  end

  def group_words_with_anagrams (anagrams, words)
    return anagrams if words.empty?
    head, *tail = *words
    anagrams = add_to_anagrams(anagrams, head)
    group_words_with_anagrams(anagrams, tail)
  end

  def anagram_groups
    group_words_with_anagrams([], self.split)
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

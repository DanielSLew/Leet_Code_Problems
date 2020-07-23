# Given an input string, reverse the string word by word

Input: "the sky is blue"
Output: "blue is sky the"

Input: "  hello world!  "
Output: "world! hello"
Explanation: Your reversed string should not contain leading or trailing spaces.

# Iterate through char by char
# Keep a boolean new_word set to false
# Keep track of the current word
# When we reach a space character, set new word to true
  # if current_word is not empty
    # push word to array w/ a space
    # set current_word to empty

# return str


def reverse_words(s)
  reversed_s = ''
  curr_word = ''
  new_word = true

  (s.length - 1).downto(0) do |idx|
    if s[idx] == ' '
      new_word = true
    else
      if new_word && !curr_word.empty?
        reversed_s << (curr_word + ' ')
        curr_word = ''
      end
      new_word = false
      curr_word = s[idx] + curr_word
    end
  end

  curr_word.empty? ? reversed_s : reversed_s + curr_word
end


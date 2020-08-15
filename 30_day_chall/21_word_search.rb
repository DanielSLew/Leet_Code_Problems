# Given a 2D board and a word, find if the word exists in the grid

# The word can be constructed from letters of sequentially adjacent cells
# adjacent is vertical or horizontal neighbouring

# Same letter cell may not be used more than once

# board =
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]

# Given word = "ABCCED", return true.
# Given word = "SEE", return true.
# Given word = "ABCB", return false.

def exist(board, word)
  board.each_with_index do |row, row_idx|
    row.each_with_index do |letter, col_idx|
      if letter == word[0] && doesWordExist?(row_idx, col_idx, board, word, 0)
        return true
      end
    end
  end

  false
end

def doesWordExist?(row_idx, col_idx, board, word, word_idx)  
  return true if word.length == word_idx

  if row_idx < 0 || col_idx < 0 || row_idx > board.length - 1 ||
     col_idx > board[0].length - 1 || !board[row_idx][col_idx] ||
     board[row_idx][col_idx] != word[word_idx]
    return false
  end

  tmp = board[row_idx][col_idx]

  board[row_idx][col_idx] = nil

  exist? = doesWordExist?(row_idx + 1, col_idx, board, word, word_idx+1) ||
           doesWordExist?(row_idx - 1, col_idx, board, word, word_idx+1) ||
           doesWordExist?(row_idx, col_idx + 1, board, word, word_idx+1) ||
           doesWordExist?(row_idx, col_idx - 1, board, word, word_idx+1)

  board[row_idx][col_idx] = tmp

  return exist?
end




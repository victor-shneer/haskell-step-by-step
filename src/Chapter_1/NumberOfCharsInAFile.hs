main :: IO ()
main = interact charCount
  where charCount input = show (length input) ++ "\n"

-- TODO test it 
-- Split counter and input
module Chapter_1.NumberOfCharsInAFile (charCount) where


-- main :: IO ()
-- main = interact charCount

charCount :: Foldable t => t a -> [Char]
charCount input = show (length input) ++ "\n"

-- TODO test it 
-- Split counter and input
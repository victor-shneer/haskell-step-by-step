module Chapter_1.NumberOfCharsInAFile (charCount) where

charCount :: Foldable t => t a -> [Char]
charCount input = show (length input) ++ "\n"

module Chapter_1.NumberOfWordsInAFile (wordCount) where

-- main :: IO ()
-- main = interact wordCount

wordCount :: String -> [Char]
wordCount input =  show (length (words input)) ++ "\n"
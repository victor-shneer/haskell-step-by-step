module Chapter_1.NumberOfWordsInAFile (wordCount) where

wordCount :: String -> [Char]
wordCount input =  show (length (words input)) ++ "\n"

main :: IO ()
main = interact wordCount
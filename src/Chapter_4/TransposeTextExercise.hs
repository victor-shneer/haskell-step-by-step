module Chapter_4.TransposeTextExercise where

import System.Environment (getArgs)

printResultToStd :: (String -> String) -> FilePath ->  IO ()
printResultToStd function inputFile = do
    input <- readFile inputFile
    putStrLn (function input)

main :: IO ()
main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [input] -> printResultToStd function input
            _ -> putStrLn "error: exactly one argument needed"

        myFunction = transpose . lines

hasEmptyString :: Foldable t => t String -> Bool
hasEmptyString list =  "" `elem` list

squashFirsts :: Foldable t => t [Char] -> [Char]
squashFirsts = foldr ((:) . head) ""

transpose :: [[Char]] -> [Char]
transpose list = squashFirsts list ++ nextIteration
                  where 
                    nextIteration = if finished
                           then "\n"
                           else "\n" ++ continue         
                    finished = hasEmptyString nextList
                    continue = transpose nextList
                    nextList = map (drop 1) list


module Chapter_4.PrintFirstWordExercise where

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

        myFunction = unwords . map (head . words) . lines
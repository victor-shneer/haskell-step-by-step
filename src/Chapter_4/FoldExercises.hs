module Chapter_4.FoldExercises (asIntFold) where

import Data.Foldable ( Foldable(foldl') )
import Data.Char (digitToInt)


{-  (Real World Haskell) write string to int function using fold #1

  Your function should behave as follows:
  ghci> asInt_fold "101" 
  101
  ghci> asInt_fold "-31337" 
  -31337
  ghci> asInt_fold "1798" 
  1798

  Extend your function to handle the following kinds of exceptional conditions by calling error:
  ghci> asInt_fold ""
  0
  ghci> asInt_fold "-" 
  0
  ghci> asInt_fold "-3"
  -3
  ghci> asInt_fold "2.7"
  *** Exception: Char.digitToInt: not a digit '.' 
  ghci> asInt_fold "314159265358979323846" 
  564616105916946374

-}

asIntFold :: String -> Int
asIntFold []                     = error "String is empty"
asIntFold "-"                    = error "Nothing to parse"
asIntFold list | '.' `elem` list = error "no support for floating numbers"
asIntFold (x:xs)                 = if x == '-' then validateResult (negate $ parseString xs) (x:xs)
                                    else validateResult (parseString (x:xs)) (x:xs)
                                    where 
                                      parseString = foldl' (\ac ch -> ac * 10 + digitToInt ch) 0
                                      validateResult int str = 
                                        if show int == str then int
                                        else error "propably the string represents the nubmer that is too big for me" 
{-  (Real World Haskell) write string to int function using fold #2

  The asInt_fold function uses error, so its callers cannot handle errors. Rewrite the function to fix this problem:
  -- file: ch04/ch04.exercises.hs type ErrorMessage = String asInt_either :: String -> Ei
  ghci> asInt_either "33" 
  Right 33
  ghci> asInt_either "foo" 
  Left "non-digit 'o'"

-}
asIntEither :: String -> Either String Int
asIntEither inputStr 
              | null inputStr       = Left "String is empty"
              | '-' `elem` inputStr = Left "No support for negative nubmers"
              | '.' `elem` inputStr = Left "No support for floating numbers"
asIntEither inputStr = case snd result of
                          Just errorM -> Left errorM
                          _ -> if show (fst result) /= inputStr
                                    then Left "Smth went wrong. Propably integer is too big"
                                    else Right $ fst result
                       where 
                          result = foldl' processChar (0, Nothing) inputStr
                          processChar ac ch = let (int, errorM) = safeDigitToInt ch
                                                    in (fst ac * 10 + int, errorM) 
                          safeDigitToInt ch = 
                            if ch `elem` ['1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f'] 
                                then(digitToInt ch, Nothing)
                                else (0, Just $ "Non digit " ++ [ch])

{-
  The Prelude function concat concatenates a list of lists into a single list and has the following type:
  concat :: [[a]] -> [a]
  Write your own definition of concat using foldr.
-}

foldrConcat :: [[a]] -> [a]
foldrConcat = foldr (++) [] 
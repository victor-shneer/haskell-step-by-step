{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldl" #-}
module Chapter_4.FoldExercises where

import Data.Char (digitToInt)
import Data.Foldable ( Foldable(foldl') )

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
*** Exception: Char.digitToInt: not a digit '.' ghci> asInt_fold "314159265358979323846" 564616105916946374

-}

asIntFold :: String -> Int
asIntFold []                     = error "String is empty"
asIntFold "-"                    = error "Nothing to parse"
asIntFold list | '.' `elem` list = error "no support for floating numbers"
asIntFold (x:xs)                 = if x == '-' then negate $ parseString xs
                                    else parseString $ x:xs
                                    where parseString = foldl' (\ac ch -> ac * 10 + digitToInt ch) 0

{-  (Real World Haskell) write string to int function using fold #2

The asInt_fold function uses error, so its callers cannot handle errors. Rewrite the function to fix this problem:
-- file: ch04/ch04.exercises.hs type ErrorMessage = String asInt_either :: String -> Ei
ghci> asInt_either "33" 
Right 33
ghci> asInt_either "foo" 
Left "non-digit 'o'"

-}
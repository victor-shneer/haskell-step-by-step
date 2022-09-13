module Chapter_3.Exercises where

import Data.Function ( on )
import Data.List ( sortBy )
import Chapter_3.ListADT (BinTree (Empty, Node))

{- 
  TODO test this module
  TODO myTail myInit
  TODO other excercises page 69-70
  TODO test with Prelude length and other buildins
-}

myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

mySum :: Num a => [a] -> a
mySum [] = 0
mySum (x:xs) 
  | myLength xs == 1 = x + head xs
  | otherwise = x + mySum xs


myMean :: (Fractional a1, Integral a2) => [a2] -> a1
myMean [] = error "Don't do this with me"
myMean list = sumL / lenL
  where 
    sumL = fromIntegral $ mySum list
    lenL = fromIntegral $ myLength list

myFancyMean :: Fractional a => [Int] -> a
myFancyMean [] = error "Stop it"
myFancyMean list = divide listSum listLength
  where
    divide = (/) `on` fromIntegral
    listSum = mySum list
    listLength = myLength list

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

listToPalindrome :: [a] -> [a]
listToPalindrome [] = []
listToPalindrome list = list ++ myReverse list

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome list
            |  list == myReverse list = True
            |  otherwise = False

sortNestedListsOnLength :: [[a]] -> [[a]]
sortNestedListsOnLength = sortBy (\l1 l2 -> compare (myLength l1) (myLength l2))

myIntersperse :: a -> [[a]] -> [a]
myIntersperse _ [] = []
myIntersperse _ list
  | myLength list == 1 = head list
myIntersperse sep (x:xs) = x ++ [sep] ++ myIntersperse sep xs

treeHeight :: BinTree a -> Int
treeHeight tree = case tree of
  Empty -> 0
  Node _ branchA branchB -> if branchAL > branchBL then branchAL else branchBL
    where 
      branchAL = 1 + treeHeight branchA
      branchBL = 1 + treeHeight branchB
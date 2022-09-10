{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Chapter_3.ListADT where

data List a = Cons a (List a)
              | Nil
                deriving (Show)
{-
In Haskell, we don’t have an equivalent of null. 
We could use the Maybe type to provide a similar effect, 
but that would bloat the pattern matching. 
Instead, we’ve decided to use a no-argument Empty constructor.
-}

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)
-- Node a
--  /   \
--Empty Node a
--      /    |  
--   Empty   Empty

data AppleTree a = AppleNode a (Maybe (AppleTree a)) (Maybe (AppleTree a))
                  deriving (Show)

-- TODO test it
fromList :: [a] -> List a
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- TODO test it
toList :: List a -> [a]
toList (Cons listHead listTail) = listHead : toList listTail
toList Nil = []

-- TODO test it
foldrFromList :: [a] -> List a
foldrFromList = foldr Cons Nil

{-# HLINT ignore "Use foldr" #-}
module Chapter_3.ListADT where

data MyMaybe a = MyJust a
  | MyNothing
    deriving Show

data List a = Cons a (List a)
              | Nil
                deriving (Show)
{-
In Haskell, we don’t have an equivalent of null. 
We could use the Maybe type to provide a similar effect, 
but that would bloat the pattern matching. 
Instead, we’ve decided to use a no-argument Empty constructor.
-}

data BinTree a = Node a (BinTree a) (BinTree a)
            | Empty
              deriving (Show)
-- Node a
--  /   \
--Empty Node a
--      /    |  
--   Empty   Empty

data MaybeTree a = Branch a (MyMaybe (MaybeTree a)) (MyMaybe (MaybeTree a))
  deriving Show

data AppleTree a = AppleNode a (Maybe (AppleTree a)) (Maybe (AppleTree a))
                  deriving (Show)


-- here I can proof that my List is valuable substitution of
-- built-in [a]
-- TODO test it
fromList :: [a] -> List a
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- TODO test it
toList :: List a -> [a]
toList (Cons listHead listTail) = listHead : toList listTail
toList Nil = []

-- Look! You can put data constractions inside foldr like functions!
-- TODO test it
foldrFromList :: [a] -> List a
foldrFromList = foldr Cons Nil

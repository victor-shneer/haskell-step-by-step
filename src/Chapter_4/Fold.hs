module Chapter_4.Fold where

-- foldl by mean of foldr
myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f z xs = foldr step id xs z
  where step x g a = g (f a x)

-- TODO make foldr with foldr

{-

On small expressions, foldl will work correctly but slowly, due to the thunking over- head that it incurs. We refer to this invisible thunking as a space leak, because our code is operating normally, but it is using far more memory than it should.
On larger expressions, code with a space leak will simply fail, as above. A space leak with foldl is a classic roadblock for new Haskell programmers. Fortunately, this is easy to avoid.
The Data.List module defines a function named foldl' that is similar to foldl, but does not build up thunks. The difference in behavior between the two is immediately obvious:
ghci> foldl (+) 0 [1..1000000] *** Exception: stack overflow ghci> :module +Data.List
ghci> foldl' (+) 0 [1..1000000] 500000500000
Due to foldl’s thunking behavior, it is wise to avoid this function in real programs, even if it doesn’t fail outright, it will be unnecessarily inefficient. Instead, import Data.List and use foldl'.

-}
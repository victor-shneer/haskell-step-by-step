module Chapter_3.AlgebraicVector where

-- x and y coordinates or lengths.
data Cartesian2D = Cartesian2D Double Double
                   deriving (Eq, Show)

-- Angle and distance (magnitude).
data Polar2D = Polar2D Double Double
               deriving (Eq, Show)

{-

If we use tuples to represent these values, 
we could quickly land ourselves in hot water 
by mixing the two representations inappropriately:

ghci> (1, 2) == (1, 2) True

-}
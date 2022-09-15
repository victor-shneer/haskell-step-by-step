module Chapter_4.Adler32Fold where

import Data.Char (ord)
import Data.Bits (shiftL, (.&.), (.|.))
base = 65521

-- look how "in" used here as a last step after reqursion finished
adler32_foldl xs = let (a, b) = foldl step (1, 0) xs
                   in (b `shiftL` 16) .|. a
  where step (a, b) x = let a' = a + (ord x .&. 0xff)
                in (a' `mod` base, (a' + b) `mod` base)

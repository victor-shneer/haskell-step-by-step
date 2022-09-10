module Chapter_3.NiceDrop where

-- TODO tests
niceDrop :: (Ord t, Num t) => t -> [a] -> [a]
niceDrop n xs | n <= 0 = xs
niceDrop _ []          = []
niceDrop n (_:xs)      = niceDrop (n - 1) xs
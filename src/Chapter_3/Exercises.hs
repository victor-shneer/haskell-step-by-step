module Chapter_3.Exercises where
-- TODO test this module
-- TODO myTail myInit
-- TODO other excercises page 69-70
-- TODO test with Prelude length
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

-- TODO why error with [Double]
myMean :: [Int] -> Double
myMean list = fromIntegral $ myLength list `div` sum list

myReverse :: [a] -> [a]
myReverse = foldr (\ x -> foldr (:) [x]) []

listToPalindrome :: [a] -> [a]
listToPalindrome [] = []
listToPalindrome list = list ++ myReverse list

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome list | null (tail list) = True
isPalindrome (x:xs) = (x == last xs) && isPalindrome (init xs)
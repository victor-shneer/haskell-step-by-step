module Chapter_4.ListFunctionsExercises where

-- TODO test it and make sure it never fails
safeSecond :: [a] -> Maybe a
safeSecond (_:x:_) = Just x  
safeSecond _       = Nothing

safeHead :: [a] -> Maybe a
safeHead (x:_) = Just x
safeHead _ = Nothing

safeTail :: [a] -> Maybe [a]
safeTail (_:xs) = Just xs
safeTail _ = Nothing

safeLast :: [a] -> Maybe a
safeLast (x:xs)
  | null xs = Just x
  | otherwise = safeLast xs
safeLast _ = Nothing

safeInit :: [a] -> Maybe [a]
safeInit list
  | null list = Nothing 
  | otherwise = Just $ take (length list-1) list

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = [] 
splitWith predicate list = pre : splitWith predicate cleanSuf
        where 
          (pre, suf) = break predicate list
          cleanSuf = dropWhile predicate suf
module Chapter_4.SuffixTree where

{-
  TODO rewrite
  The pattern xs@(_:xs') is called an as-pattern, 
  and it means 
  “bind the variable xs to the value that matches the right side of the @ symbol.”

  When we defined suffixes, 
  we reused the value xs that we matched with our as-pattern. 
  Since we reuse an existing value, 
  we avoid a little allocation.

  and this suffixes function
  is out take on tails funtion
  that produses all not empty tails:

  ghci> tails "foo" ["foo","oo","o",""] 
  ghci> suffixes "foo" ["foo","oo","o"]
-}
suffixes :: [a] -> [[a]]
suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []
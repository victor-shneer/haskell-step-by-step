module Chapter_2.LastButOne (lastButOne) where

lastButOne :: [a] -> a
lastButOne list = if null $ tail $ tail list 
                  then head list 
                  else lastButOne $ tail list 
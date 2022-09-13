# Chapter 4 Functional programming

- simple command-line framework, see FixLines.hs  
- infix notation works with data constructors as well  
In other words you should get used to the fact  
that data constructors are functions:    
```haskell
data a `Pair` b = a `Pair` b deriving (Show)
```
## Useful Prelude functions

### break 
```haskell
break :: forall a. (a -> Bool) -> [a] -> ([a], [a])
```

Take a function that returns bools and a list. Then split the list into pair on the first element that returns True with the provided function 
```
ghci> break odd [2,4,5,6,8] 
([2,4],[5,6,8])
ghci> :module +Data.Char 
ghci> break isUpper "isUpper" 
("is","Upper")
```
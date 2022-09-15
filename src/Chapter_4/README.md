# Chapter 4 Functional programming

- simple command-line framework, see FixLines.hs  
- infix notation works with data constructors as well  
In other words you should get used to the fact  
that data constructors are functions:    
```haskell
data a `Pair` b = a `Pair` b deriving (Show)
```

- list length

We’ve already seen the definition of the list algebraic data type many times, and we know that a list doesn’t store its own length explicitly. Thus, the only way that length can operate is to walk the entire list.
Thus this is bad:
```haskell
myDumbExample xs = if length xs > 0
then head xs else 'Z'
```
A more appropriate function to call here instead is null, which runs in constant time.
```haskell
mySmartExample xs = if not (null xs)
then head xs else 'Z'
myOtherExample (x:_) = x myOtherExample [] = 'Z'
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
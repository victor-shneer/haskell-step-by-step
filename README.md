# Learn Haskell step by step

## Story

I started again with Real World Haskell book 
And now I want to do it in a right way
Here you can find a footprint of my learning journey
  
Tel Aviv
7 Sep 2022


## enviroment set-up
https://medium.com/@dogwith1eye/setting-up-haskell-in-vs-code-with-stack-and-the-ide-engine-81d49eda3ecf

## ghci tricks
:set prompt "ghci> "

:set +t   -- to print more type information for each entry
:unset +t
:type 'a' -- to print type information for a value

:m +Data.Ratio -- to add rational numbers operations

:show bindings

## run programms with input
runghc src/Chapter_1/SimpleProgram < src/Chapter_1/quux.txt
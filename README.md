# Learn Haskell step by step

## enviroment set-up
https://medium.com/@dogwith1eye/setting-up-haskell-in-vs-code-with-stack-and-the-ide-engine-81d49eda3ecf

## ghci commands
:set prompt "ghci> "

:set +t   -- to print more type information for each entry    
:unset +t    
:type 'a' -- to print type information for a value   

:m +Data.Ratio -- to add rational numbers operations

:load src/Chapter_2/add.hs -- to source files  
:cd /tmp -- to change directories inside ghci   

:show bindings

:info -- gets ghci to tell us everything it knows about a name

## run programms with input
runghc src/Chapter_1/SimpleProgram < src/Chapter_1/quux.txt

## Story

I started again with Real World Haskell book  
And now I want to do it in a right way  
Here you can find a footprint of my learning journey  
Not sure that it can be usefull to anybody  
Except me :)  

## TODOs
add README for each chapter
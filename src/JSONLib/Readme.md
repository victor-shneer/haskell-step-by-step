# Real World Haskell Chapter 5

## run with stack

```
stack build
ghc -c src/JSONLib/SimpleJSON.hs    
stack ghc app/Main.hs src/JSONLib/SimpleJSON.o
./app/Main
```
Since we are using stack in the project.  
I found it easier to run `ghc` under stack.  
It avoid `Could not find module` problems.  
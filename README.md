# Learn Haskell step by step

## Enviroment set-up
Article is a little bit outdated. In 2022 I still could archive the same results with some deviations of the installation process. Tip: don't afraid to read error messages :) [Setting Up Haskell In Vs Code With Stack And The IDE Engine](https://medium.com/@dogwith1eye/setting-up-haskell-in-vs-code-with-stack-and-the-ide-engine-81d49eda3ecf)  

## Inside ghci
```
:set prompt "ghci> "

:set +t   -- to print more type information for each entry    
:unset +t    
:type 'a' -- to print type information for a value   

:m +Data.Ratio -- to add rational numbers operations

:load src/Chapter_2/add.hs -- to add source files  
:cd /tmp -- to change directories inside ghci   

:show bindings

:info -- gets ghci to tell us everything it knows about a name

```


## Compiler commands
```
runghc src/Chapter_1/SimpleProgram < src/Chapter_1/quux.txt
```
Compile haskell source to an executable named InteractWith. We need -main-is because by default ghc assume that main is located in Main module. This is not our case.  
```
ghc -main-is Chapter_4.InteractWith  src/Chapter_4/InteractWith.hs
```


## TODOs
- [ ] you don't need readme for each chapter but good comment sections
- [ ] test should not be module? [Link](https://stackoverflow.com/questions/58944736/hspec-defined-tests-invoked-with-stack-throw-an-error-when-test-file-is-defined)
- [ ] maybe I should not blindly copy paste from the book, considering copyright
- [ ] rename modules. From Chapter to related topic
- [x] you can rethink the whole repo as Haskell+f programming learning hub. Not only Real World Haskel
- [ ] put ghci commands in the separate directory and rething this README as a Table of Contents
- [x] ~~add daml directory. you can start with DA.VALIDATION~~ move the idea to another [repo](https://github.com/victor-shneer/daml-studies)
- [ ] add circle ci with tests and protect main
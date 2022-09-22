module JSONLib.PrettyStub where

data Doc = ToBeDefined deriving (Show)

-- very usefull when you want to pass typecheck 
-- but not yet ready to implement a function
string :: String -> Doc 
string str = undefined 

text :: String -> Doc 
text str = undefined

double :: Double -> Doc 
double num = undefined

(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc 
char c = undefined

hcat :: [Doc] -> Doc
hcat xs = undefined

fsep :: [Doc] -> Doc
fsep xs = undefined


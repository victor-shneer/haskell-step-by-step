module Main (main) where
import JSONLib.SimpleJSON (JValue(JObject, JNumber, JBool))

main :: IO ()
main = print (JObject [("foo", JNumber 1), ("bar", JBool False)])
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use withFile" #-}
module FindCommand.BetterPredicate where

import Control.Monad (filterM)
import System.Directory (Permissions(..), getModificationTime, getPermissions)
import System.FilePath (takeExtension)
import Data.Time ( UTCTime )
import Control.Exception (bracket, handle, SomeException(..))
import System.IO (IOMode(..), hClose, hFileSize, openFile)

import FindCommand.RecursiveContents (getRecursiveContents)


type InfoP a =  FilePath      -- path to directory entry 
             -> Permissions   -- permissions
             -> Maybe Integer -- file size (Nothing if not file) 
             -> UTCTime       -- last modified
             -> a

getFileSize :: FilePath -> IO (Maybe Integer)
getFileSize path = handle (\(SomeException _) -> return Nothing) $
  bracket (openFile path ReadMode) hClose $ \h -> do
    size <- hFileSize h
    return (Just size)

betterFind :: InfoP Bool -> FilePath -> IO [FilePath]
betterFind p path = getRecursiveContents path >>= filterM check 
    where check name = do
            perms <- getPermissions name
            size <- getFileSize name
            modified <- getModificationTime name 
            return (p name perms size modified)

simpleFileSize :: FilePath -> IO Integer
simpleFileSize path = do
  h <- openFile path ReadMode
  size <- hFileSize h
  hClose h
  return size

saferFileSize :: FilePath -> IO (Maybe Integer)
saferFileSize path = handle (\(SomeException _)  -> return Nothing) $ do
  h <- openFile path ReadMode
  size <- hFileSize h
  hClose h
  return (Just size)

pathP :: InfoP FilePath
pathP path _ _ _ = path

sizeP :: InfoP Integer
sizeP _ _ (Just size) _ = size
sizeP _ _ Nothing _ = -1

liftP :: (a -> b -> c) -> InfoP a -> b -> InfoP c 
liftP q f k w x y z = f w x y z `q` k

greaterP, lesserP :: (Ord a) => InfoP a -> a -> InfoP Bool 
greaterP = liftP (>)
lesserP = liftP (<)

equalP :: (Eq a) => InfoP a -> a -> InfoP Bool
equalP = liftP (==)

liftP2 :: (a -> b -> c) -> InfoP a -> InfoP b -> InfoP c 
liftP2 q f g w x y z = f w x y z `q` g w x y z

andP :: InfoP Bool -> InfoP Bool -> InfoP Bool
andP = liftP2 (&&) 
orP :: InfoP Bool -> InfoP Bool -> InfoP Bool
orP = liftP2 (||)

myTest path _ (Just size) _ =
  takeExtension path == ".cpp" && size > 131072
myTest _ _ _ _ = False

liftPath :: (FilePath -> a) -> InfoP a
liftPath f w _ _ _ = f w

myTest2 = (liftPath takeExtension `equalP` ".cpp") `andP` 
          (sizeP `greaterP` 131072)

(==?) = equalP
(&&?) = andP
(>?) = greaterP

infix 4 ==?
infixr 3 &&?
infix 4 >?

myTest3 = (liftPath takeExtension ==? ".cpp") &&? (sizeP >? 131072)
myTest4 = liftPath takeExtension ==? ".cpp" &&? sizeP >? 131072
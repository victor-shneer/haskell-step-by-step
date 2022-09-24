{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use withFile" #-}
module FindCommand.ControlledVisit where
import System.Directory (Permissions (searchable), getDirectoryContents, getPermissions, getModificationTime)
import Data.Time ( UTCTime )
import Prelude hiding (traverse)
import Control.Monad (forM, liftM)
import System.FilePath ((</>))
import Control.Exception (handle, bracket, SomeException (SomeException))
import System.IO (openFile, IOMode (..), hClose, hFileSize)

data Info = Info {
    infoPath :: FilePath
  , infoPerms :: Maybe Permissions
  , infoSize :: Maybe Integer
  , infoModTime :: Maybe UTCTime
} deriving (Eq, Ord, Show)

-- getInfo :: FilePath -> IO Info

traverse :: ([Info] -> [Info]) -> FilePath -> IO [Info]
traverse order path = do
  names <- getUsefulContents path
  contents <- mapM getInfo (path : map (path </>) names)
  liftM concat $ forM (order contents) $ \info -> do
    if isDirectory info && infoPath info /= path
      then traverse order (infoPath info)
      else return [info]

getUsefulContents :: FilePath -> IO [String] 
getUsefulContents path = do
  names <- getDirectoryContents path
  return (filter (`notElem` [".", ".."]) names)

isDirectory :: Info -> Bool
isDirectory = maybe False searchable . infoPerms

maybeIO :: IO a -> IO (Maybe a)
maybeIO act = handle (\(SomeException _) -> return Nothing) (Just `liftM` act)

getInfo path = do
  perms <- maybeIO (getPermissions path)  
  size <- maybeIO (bracket (openFile path ReadMode) hClose hFileSize) 
  modified <- maybeIO (getModificationTime path)
  return (Info path perms size modified)
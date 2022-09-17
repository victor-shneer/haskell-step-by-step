{-# LANGUAGE DeriveGeneric #-}
module ApplicativeComposition.ReservationDataModel where
import GHC.Generics (Generic)
import Data.Time (ZonedTime)


data ReservationJson = ReservationJson {
  jsonDate :: String,
  jsonQuantity :: Double,
  jsonName :: String,
  jsonEmail :: String }
  deriving (Eq, Show, Read, Generic)


data Reservation = Reservation {
  reservationDate :: ZonedTime,
  reservationQuantity :: Int,
  reservationName :: String,
  reservationEmail :: String }
  deriving (Show, Read)

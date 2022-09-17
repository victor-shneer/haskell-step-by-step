{-# LANGUAGE DeriveFunctor #-}
module ApplicativeComposition.ReservationJSONValidation where

import Data.Time (ZonedTime)
import Text.Read (readMaybe)
import ApplicativeComposition.ReservationDataModel


newtype Validation e r = Validation (Either e r) deriving (Eq, Show, Functor)
instance Monoid m => Applicative (Validation m) where
  pure = Validation . pure
  Validation (Left x) <*> Validation (Left y) = Validation (Left (mappend x y))
  Validation f <*> Validation r = Validation (f <*> r)

validateDate :: String -> Validation [String] ZonedTime
validateDate candidate =
  case readMaybe candidate of
    Just d  -> Validation $ Right d
    Nothing -> Validation $ Left ["Not a date."]
{-
  for golf lovers :)
  validateDate = Validation . maybe (Left ["Not a date."]) Right . readMaybe
-}


validateQuantity :: Double -> Validation [String] Int
validateQuantity candidate =
  if isInt candidate && candidate > 0
    then Validation $ Right $ round candidate
    else Validation $ Left ["Not a positive integer."]
  where isInt x = x == fromInteger (round x)


validateEmail :: String -> Validation [String] String
validateEmail candidate =
  if '@' `elem` candidate
    then Validation $ Right candidate
    else Validation $ Left ["Not an email address."]


validateReservation :: ReservationJson -> Validation [String] Reservation
validateReservation candidate =
  (Reservation <$> vDate) <*> vQuantity <*> vName <*> vEmail
  where
    vDate     = validateDate     $ jsonDate     candidate
    vQuantity = validateQuantity $ jsonQuantity candidate
    vName     = pure             $ jsonName     candidate
    vEmail    = validateEmail    $ jsonEmail    candidate
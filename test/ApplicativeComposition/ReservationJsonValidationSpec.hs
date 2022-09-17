module ApplicativeComposition.ReservationJsonValidationSpec where

import SpecHelper


goodReservation = ReservationJson "2017-06-30 19:00:00+02:00" 4 "Jane Doe" "j@example.com"
goodReservationOutcome = "Validation (Right (Reservation {reservationDate = 2017-06-30 19:00:00 +0200, reservationQuantity = 4, reservationName = \"Jane Doe\", reservationEmail = \"j@example.com\"}))"

badReservation1 = ReservationJson "2017/14/12 6pm" 4.1 "Jane Doe" "jane.example.com"
badReservation2 = ReservationJson "2017-06-30 19:00:00+02:00" (-3) "Jane Doe" "j@example.com"
badReservation1Outcome = "Validation (Left [\"Not a date.\",\"Not a positive integer.\",\"Not an email address.\"])"
badReservation2Outcome = "Validation (Left [\"Not a positive integer.\"])"

spec :: Spec
spec =
  describe "reservationValidation" $ do
    context ("with " ++ show goodReservation) $
      it ("should be " ++ goodReservationOutcome) $
        show (validateReservation goodReservation) `shouldBe` goodReservationOutcome

    context ("with " ++ show badReservation1) $
      it ("should be " ++ badReservation1Outcome) $
        show (validateReservation badReservation1) `shouldBe` badReservation1Outcome

    context ("with " ++ show badReservation2) $
      it ("should be " ++ badReservation2Outcome) $
        show (validateReservation badReservation2) `shouldBe` badReservation2Outcome

main :: IO ()
main = hspec spec
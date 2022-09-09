module Chapter_2.LastButOneSpec where

import SpecHelper

spec :: Spec
spec =
  describe "lastButOne" $ do
    context "with \"123\"" $
      it "should be 2" $
        lastButOne "123" `shouldBe` '2'

main :: IO ()
main = hspec spec
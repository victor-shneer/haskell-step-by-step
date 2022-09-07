module Chapter_1.NumberOfWordsSpec where

import SpecHelper

spec :: Spec
spec =
  describe "wordCount" $ do
    context "with \"first second third\"" $
      it "should be 3\n" $
        wordCount "first second third" `shouldBe` "3\n"

main :: IO ()
main = hspec spec
module Chapter_1.NumberOfCharsSpec where


import SpecHelper

spec :: Spec
spec =
  describe "charCount" $ do
    context "123" $
      it "should be 3\n" $
        charCount "123" `shouldBe` "3\n"

main :: IO ()
main = hspec spec
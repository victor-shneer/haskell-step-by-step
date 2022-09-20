module Chapter_4.AsIntFoldSpec where

import SpecHelper


spec :: Spec
spec = 
  describe  "Str as Int " $ do
    context "with \"-3\"" $
      it "should be -3" $
        asIntFold "-3" `shouldBe` (-3)

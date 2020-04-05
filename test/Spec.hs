import           Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Adding" $ do
        it "can add two numbers" $ do
            (1 + 2) `shouldBe` 3

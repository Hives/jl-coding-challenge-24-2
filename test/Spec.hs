import           Hands
import           Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Detecting types of hand" $ do
        describe "Get straight" $ do
            it "returns empty list for empty hand" $ do
                getStraight [] `shouldBe` []

            it "returns empty list if no straight" $ do
                getStraight (stringToCards "2C 2S 2H 3D 4C 5S 7H") `shouldBe` []

            it "can retrieve a straight" $ do
                getStraight (stringToCards "2C 2S 2H 3D 4C 5S 6H")
                    `shouldBe` [ Card 2 C
                               , Card 3 D
                               , Card 4 C
                               , Card 5 S
                               , Card 6 H
                               ]

            it "can retrieve a straight if there are multiples of a middle card"
                $ do
                      getStraight (stringToCards "2C 2H 3D 4C 4S 5S 6H")
                          `shouldBe` [ Card 2 C
                                     , Card 3 D
                                     , Card 4 C
                                     , Card 5 S
                                     , Card 6 H
                                     ]

            it "can retrieve a straight with high ace" $ do
                getStraight (stringToCards "2C 2S 10S JD QC KS AH")
                    `shouldBe` [ Card 10 S
                               , Card 11 D
                               , Card 12 C
                               , Card 13 S
                               , Card 14 H
                               ]

    describe "Utility functions" $ do
        describe "toCard" $ do
            it "converts a string representation of a card to a Card" $ do
                toCard "2H" `shouldBe` Card 2 H
            it "converts a ten" $ do
                toCard "10D" `shouldBe` Card 10 D
            it "converts a jack" $ do
                toCard "JS" `shouldBe` Card 11 S
            it "converts a queen" $ do
                toCard "QC" `shouldBe` Card 12 C
            it "converts a king" $ do
                toCard "KH" `shouldBe` Card 13 H
            it "converts a ace" $ do
                toCard "AD" `shouldBe` Card 14 D

        describe "sorting cards" $ do
            it "2H < 3H" $ do
                sortCards (toCard "2H") (toCard "3H") `shouldBe` LT
            it "QD < KS" $ do
                sortCards (toCard "QD") (toCard "KS") `shouldBe` LT
            it "AS > 2C" $ do
                sortCards (toCard "AS") (toCard "2C") `shouldBe` GT
            it "9S '==' 9D" $ do
                sortCards (toCard "9S") (toCard "9D") `shouldBe` EQ

        describe "stringToCards" $ do
            it "converts a string to a list of Cards" $ do
                stringToCards "2C 2S 10C JS QH KD AS"
                    `shouldBe` [ Card 2  C
                               , Card 2  S
                               , Card 10 C
                               , Card 11 S
                               , Card 12 H
                               , Card 13 D
                               , Card 14 S
                               ]

            it "sorts the cards by value" $ do
                stringToCards "10C 9C 8C 2C 3C AC"
                    `shouldBe` [ Card 2  C
                               , Card 3  C
                               , Card 8  C
                               , Card 9  C
                               , Card 10 C
                               , Card 14 C
                               ]

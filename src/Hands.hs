module Hands where

import           Data.List

data Suit = C | D | H | S
    deriving (Eq, Show)

data Card = Card Int Suit
  deriving (Eq, Show)

toCard :: String -> Card
toCard c = Card value suit
 where
  value | init c == "J" = 11
        | init c == "Q" = 12
        | init c == "K" = 13
        | init c == "A" = 14
        | otherwise     = read (init c) :: Int
  suit | last c == 'C' = C
       | last c == 'S' = S
       | last c == 'D' = D
       | last c == 'H' = H

sortCards :: Card -> Card -> Ordering
sortCards (Card value1 suit1) (Card value2 suit2) | value1 > value2  = GT
                                                  | value1 < value2  = LT
                                                  | value1 == value2 = EQ

stringToCards :: String -> [Card]
stringToCards = sortBy sortCards . map toCard . words

getStraight :: [Card] -> [Card]
getStraight []             = []
getStraight (card : cards) = f cards [card]
 where
  f _ acc | length acc == 5 = acc
  f [] acc                  = []
  f (card : cards) acc | value == lastAccValue     = f cards acc
                       | value == lastAccValue + 1 = f cards (acc ++ [card])
                       | otherwise                 = f cards [card]
   where
    (Card value        _) = card
    (Card lastAccValue _) = last acc

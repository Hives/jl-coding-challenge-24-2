module Lib
    ( someFunc
    )
where

add :: Int -> Int -> Int
add a b = a + b

someFunc :: IO ()
someFunc = print (add 5 6)

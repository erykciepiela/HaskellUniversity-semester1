module FizzBuzz
    ( program
    ) where

import System.Environment

program :: IO ()
program = print $ fmap fizzbuzz [1..20]

fizzbuzz :: Int -> String
fizzbuzz i
  | i `mod` 15 == 0 = "fizzbuzz"
  | i `mod` 3 == 0 = "fizz"
  | i `mod` 5 == 0 = "buzz"
  | otherwise = show i

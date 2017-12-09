module FizzBuzz
    ( program,
      fizzbuzz
    ) where

import System.Environment
import Data.Maybe

program :: IO ()
program = print $ fizzbuzz 20

fizzbuzz n = answer [each 3 "fizz", each 5 "buzz"] show <$> [1..n]

answer :: Monoid s => [a -> Maybe s] -> (a -> s) -> a -> s
answer maybefs defaultf i = fromMaybe (defaultf i) (mconcat (fmap ($ i) maybefs))

each :: Int -> String -> Int -> Maybe String
each j s i = if i `mod` j == 0 then Just s else Nothing

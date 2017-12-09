module FizzBuzz
    ( program
    ) where

import System.Environment
import Data.Maybe

program :: IO ()
program = print $ answer [each 3 "fizz", each 5 "buzz"] show <$> [1..20]

answer :: Monoid s => [a -> Maybe s] -> (a -> s) -> a -> s
answer maybefs defaultf i = fromMaybe (defaultf i) (mconcat (fmap ($ i) maybefs))

each :: Int -> String -> Int -> Maybe String
each j s i = if i `mod` j == 0 then Just s else Nothing

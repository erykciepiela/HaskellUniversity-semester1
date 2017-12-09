module FizzBuzz
    ( program
    ) where

import System.Environment
import Data.Maybe

program :: IO ()
program = print $ answer [each 3 "fizz", each 5 "buzz"] show <$> [1..20]

each :: Int -> String -> Int -> Maybe String
each j s i = if i `mod` j == 0 then Just s else Nothing

answer :: [Int -> Maybe String] -> (Int -> String) -> Int -> String
answer f d i = let x = fmap ($ i) f in fromMaybe (d i) (xxx x)
  where
    xxx :: [Maybe String] -> Maybe String
    xxx [] = Nothing
    xxx (Just s:mss) = case xxx mss of
      Nothing -> Just s
      Just ss -> Just (s ++ ss)
    xxx (Nothing:mss) = case xxx mss of
      Nothing -> Nothing
      Just ss -> Just ss

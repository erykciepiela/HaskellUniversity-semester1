import Test.QuickCheck

import QuicksortInt
import FizzBuzz
import Data.List

sorts :: ([Int] -> [Int]) -> [Int] -> Bool
sorts sort xs = isSorted $ sort xs
  where
    isSorted [] = True
    isSorted [_] = True
    isSorted (x1:(rest@(x2:xs))) = x1 <= x2 && isSorted rest

fizzbuzzes :: (Int -> [String]) -> Int -> Bool
fizzbuzzes f n = let
  result = f n
  fizzes = findIndices ("fizz" `isInfixOf`) result
  buzzess = findIndices ("buzz" `isInfixOf`) result
  in all (\x -> (x + 1) `mod` 3 == 0) fizzes && all (\x -> (x + 1) `mod` 5 == 0) buzzess

main :: IO ()
main = do
  quickCheck $ sorts quicksort
  quickCheck $ fizzbuzzes fizzbuzz

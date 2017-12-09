module QuicksortInt
    ( program,
      quicksort
    ) where

import System.Environment

program :: IO ()
program = getArgs >>= print . quicksort . fmap read

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (i:is) = quicksort [x | x <- is, x <= i] ++ [i] ++ quicksort [x | x <- is, x > i]

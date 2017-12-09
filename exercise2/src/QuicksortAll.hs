{-# LANGUAGE ScopedTypeVariables #-}
module QuicksortAll
    ( program
    ) where

import System.Environment

program :: IO ()
program = do
  args <- getArgs
  let (bools :: [Bool]) = fmap read args
  print $ quicksort bools

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (i:is) = quicksort [x | x <- is, x <= i] ++ [i] ++ quicksort [x | x <- is, x > i]

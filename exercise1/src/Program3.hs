module Program3
    ( program
    ) where

import Control.Monad (forever)

program :: IO ()
program = forever $ do
  putStrLn "Hello, What is your name?"
  name <- getLine
  putStrLn $ "Nice to meet you " ++ name

module Program2
    ( program
    ) where

program :: IO ()
program = do
  putStrLn "Hello, What is your name?"
  name <- getLine
  putStrLn $ "Nice to meet you " ++ name

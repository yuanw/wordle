module Main where

import Control.DeepSeq (deepseq)
import Words (guessWords, finalWords)

main :: IO ()
--main = return () --print finalWords >> print guessWords
main = do
  print (guessWords `deepseq` finalWords `deepseq` "Hello world")

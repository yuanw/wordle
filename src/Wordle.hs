module Wordle where

import qualified Data.Set as S
import qualified Data.Vector as V
import qualified Data.Text as T
import qualified Data.Map as M

data LetterInformation
   = LetterNotInWord
   | LetterNitInLocations (S.Set Location)

data State = MkState (M.Map Char LetterInformation)

filterWords :: State -> V.Vector T.Text -> V.Vector T.Text
filterWords = undefined

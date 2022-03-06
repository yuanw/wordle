module Wordle where

import qualified Data.Set as S
import qualified Data.Vector as V
import qualified Data.Text as T
import qualified Data.Map.Strict as M
import Words (WordleWord, getLetters)
type Location = Int -- Int in range 0 - 4

data LetterInformation
   = LetterNotInWord
   | LetterNotInLocations (S.Set Location)

data State = MkState (M.Map Char LetterInformation)

-- filterWords :: State -> V.Vector WordleWord -> V.Vector WordleWord
-- filterWords (MkState mapping) words = V.filter predicate words
--   where
--     predicate :: WordleWord -> Bool
--     predicate word = V.ifoldl' go True (getLetters word)
--     where
--       go :: Bool -> Int -> Char -> Bool
--       go False _ _ = False
--       go True index letter = case M.lookup letter mapping of
--         Nothing -> True
--       -- see a letter that we know it is not in the word. Reject!
--         Just LetterNotInWord -> False
--         Just (LetterNotInLocations excludedLocs) -> not (index `S.member` excludedLocs)

--     requireWordP :: WordleWord -> Bool
--     requireWordP word = undefined
--       where
--         requiredWords = M.foldlWithKy' go S.empty mapping
--         go :: S.Set Char -> Char -> LetterInformation -> S.Set Char
--         go acc c info = case info of
--           LetterNotInWord -> acc
--           LetterNotInLocations -> c `S.insert` acc

-- Suppose we get XXYXG for a guess of
peachState :: State
peachState = MkState (M.fromList [('p', LetterNotInWord),
                                  ('e', LetterNotInWord),
                                  ('a', LetterNotInLocations (S.fromList [2])),
                                  ('c', LetterNotInWord),
                                  ('h', LetterNotInLocations (S.fromList [0, 1,2,3]))
                                 ])

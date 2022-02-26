{-# LANGUAGE TemplateHaskell #-}

module M (isStaticIdSet) where

import TH_Lift
import Data.IntSet as S
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
type Id = Int

isStaticIdSet :: Int -> Bool
isStaticIdSet x =
    x `S.member` staticSet
  where
    staticSet = $$(liftTyped (S.fromList [1,2,3,5,7] :: IntSet))

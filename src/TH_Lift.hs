{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveLift #-}
{-# LANGUAGE FlexibleInstances #-}
module TH_Lift  where

import Language.Haskell.TH.Syntax ( Lift )

import Data.IntSet.Internal ( IntSet(..) )

import Data.Set.Internal (Set(..))
import qualified Data.Text as T

deriving instance Lift IntSet
deriving instance Lift (Set T.Text)

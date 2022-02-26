{-# LANGUAGE TemplateHaskell #-} -- Enable TH
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveLift #-}

module TH_Lift  where

import Language.Haskell.TH.Syntax ( Lift )

import Data.IntSet.Internal ( IntSet(..) )
import Data.Vector
import Data.Text

deriving instance Lift (IntSet)

deriving instance Lift (Vector Text)

{-# LANGUAGE TemplateHaskell #-} -- Enable TH
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveLift #-}
{-# LANGUAGE FlexibleInstances #-}
module TH_Lift  where

import Language.Haskell.TH.Syntax ( Lift )

import Data.IntSet.Internal ( IntSet(..) )
deriving instance Lift (IntSet)

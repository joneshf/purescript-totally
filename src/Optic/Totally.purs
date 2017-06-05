module Optic.Totally where

import Prelude
import Data.Either (Either(..), either)

class Totally a where
  totally :: forall b. a -> b

instance totallyVoid :: Totally Void where
  totally = absurd

instance totallyEither :: (Totally a, Totally b) => Totally (Either a b) where
  totally = case _ of
    Left a -> totally a
    Right b -> totally b

like
  :: forall a b c d e
   . ((a -> Either a Void) -> b -> Either c d)
  -> (c -> e)
  -> (d -> e)
  -> b
  -> e
like f g h = either g h <<< f Left

module Optic.Totally where

  import Data.Either (Either(..), either)
  import Data.Void (Void(), absurd)

  class Totally a where
    totally :: forall b. a -> b

  instance totallyVoid :: Totally Void where
    totally = absurd

  instance totallyEither :: (Totally a, Totally b) => Totally (Either a b) where
    totally (Left x)  = totally x
    totally (Right x) = totally x

  like :: forall a b c d e
       .  ((a -> Either a Void) -> b -> Either c d)
       -> (c -> e)
       -> (d -> e)
       -> b
       -> e
  like f g h x = either g h $ f Left x

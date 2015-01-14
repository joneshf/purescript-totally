# Module Documentation

## Module Optic.Totally

### Type Classes


    class Totally a where

      totally :: forall b. a -> b


### Type Class Instances


    instance totallyEither :: (Totally a, Totally b) => Totally (Either a b)


    instance totallyVoid :: Totally Void


### Values


    like :: forall a b c d e. ((a -> Either a Void) -> b -> Either c d) -> (c -> e) -> (d -> e) -> b -> e




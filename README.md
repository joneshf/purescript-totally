# Module Documentation

## Module Optic.Totally

#### `Totally`

``` purescript
class Totally a where
  totally :: forall b. a -> b
```


#### `totallyVoid`

``` purescript
instance totallyVoid :: Totally Void
```


#### `totallyEither`

``` purescript
instance totallyEither :: (Totally a, Totally b) => Totally (Either a b)
```


#### `like`

``` purescript
like :: forall a b c d e. ((a -> Either a Void) -> b -> Either c d) -> (c -> e) -> (d -> e) -> b -> e
```





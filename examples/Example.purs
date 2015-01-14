module Examples.Optic.Totally.Example where

  import Data.Either

  import Debug.Trace

  import Optic.Core
  import Optic.Refractor.Prism
  import Optic.Totally

  data Example a b c = A a
                     | B b
                     | C c

  _A :: forall a b c d e f. Prism (Example a b c) (Example d b c) a d
  _A = prism A \ex -> case ex of
    A a -> Right a
    B b -> Left $ B b
    C c -> Left $ C c

  _B :: forall a b c d e f. Prism (Example a b c) (Example a d c) b d
  _B = prism B \ex -> case ex of
    A a -> Left $ A a
    B b -> Right b
    C c -> Left $ C c

  _C :: forall a b c d e f. Prism (Example a b c) (Example a b d) c d
  _C = prism C \ex -> case ex of
    A a -> Left $ A a
    B b -> Left $ B b
    C c -> Right c

  instance totallyExample :: (Totally a, Totally b, Totally c) => Totally (Example a b c) where
    totally (A a) = totally a
    totally (B b) = totally b
    totally (C c) = totally c

  foo :: Example Number Boolean String -> String
  foo = totally
    # like _A show
    # like _B show
    # like _C id

  main = do
    print $ foo $ A 1
    print $ foo $ B true
    print $ foo $ C "wat"

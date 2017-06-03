module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Either (Either(..))

import Optic.Core (Prism)
import Optic.Prism (prism)
import Optic.Totally (class Totally, like, totally)

data Example a b c
  = A a
  | B b
  | C c

_A :: forall a b c d. Prism (Example a b c) (Example d b c) a d
_A = prism A $ case _ of
  A a -> Right a
  B b -> Left $ B b
  C c -> Left $ C c

_B :: forall a b c d. Prism (Example a b c) (Example a d c) b d
_B = prism B $ case _ of
  A a -> Left $ A a
  B b -> Right b
  C c -> Left $ C c

_C :: forall a b c d. Prism (Example a b c) (Example a b d) c d
_C = prism C $ case _ of
  A a -> Left $ A a
  B b -> Left $ B b
  C c -> Right c

instance totallyExample :: (Totally a, Totally b, Totally c) => Totally (Example a b c) where
  totally = case _ of
    A a -> totally a
    B b -> totally b
    C c -> totally c

foo :: Example Int Boolean String -> String
foo = totally
  # like _A show
  # like _B show
  # like _C id

main :: Eff (console :: CONSOLE) Unit
main = do
  log $ foo $ A 1
  log $ foo $ B true
  log $ foo $ C "wat"

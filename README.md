# purescript-totally

PureScript exhaustivity checker for prisms based on the [Haskell `total` library](http://www.haskellforall.com/2015/01/total-100-exhaustive-pattern-matching.html) by Gabriel Gonzalez.

## Installation

```
bower install purescript-totally
```

## Example

`purescript-totally` lets you write Prism-based exhaustive functions that look something like this:

``` purescript
data Example a b c
  = A a
  | B b
  | C c

-- snipped prism defs & Totally instance...

foo :: Example Int Boolean String -> String
foo = totally
  # like _A show
  # like _B show
  # like _C id
```

See [the test file](test/Main.purs) for the missing definitions and a runnable example of this.

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-totally).

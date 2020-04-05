# John Lewis Coding Challenge 24

Texas Hold 'Em
<https://coding-challenges.jl-engineering.net/challenges/challenge-24/>

Using Haskell

## Toolchain

This project uses `stack` with resolver `lts-15.3`, corresponding to GHC
compiler version `8.8.2`.

## Compile and run

```shell
> stack build && stack exec poker-exe
```

## Tests

```shell
> stack test
```

## Features

The function `getStraight`, given seven cards (a hand of two plus five community
cards) returns a straight of five cards, if one exists, or else an empty list -
as long as the straight doesn't start with a low ace!

Next thing to implement - either a straight with a low ace to complete the
`getStraight` function, or a similar `getFlush` function, which could then be
combined with `getStraight` to make a `getStraightFlush`.

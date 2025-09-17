# Recitation 1

## A Mystery

We can interpret the logic as the following:

1) At least 3 people are in the cabal.
2) Stav and David are not both in the cabal.
3) If either Martyna or Patrice are in the cabal, everyone is in the cabal.
4) If Stav is in the cabal, David is in the cabal.
5) If Darren is in the cabal, Martyna is in the cabal.
6) If Oscar or Nick are in the cabal, then Tom is not in the cabal.
7) If Oscar or David are in the cabal, then Marten is not in the cabal.

From [2] and [4] we know Stav is not in the cabal (Stav being in the cabal would mean one is not true).

Because Stav is not in the cabal, we know neither Martyna or Patrice are in the cabal (since if either was in the cabal then [3] would not be true).

Because Martyna is not in the cabal, we know Darren is not in the cabal (otherwise [5] would be violated).

Currently we know these are not in the cabal:
- Stav
- Martyna
- Patrice
- Darren

And we are not sure about:
- Oscar
- David
- Nick
- Marten
- Tom

We can test each:

If Oscar is in the cabal, then Tom and Marten are not in the cabal. We need three people in the cabal, so David and Nick must also be in the cabal.

If Oscar is not in the cabal, then we need at least three of David, Nick, Marten, and Tom in the cabal. However, because of (6) and (7), Nick and Tom cannot be in the cabal together, nor can David and Marten, so only two people can be in the cabal.

Therefore, the cabal is Oscar, David, and Nick.
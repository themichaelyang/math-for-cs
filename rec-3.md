# Recitation 3

## Problem: Breaking a chocolate bar

We are given a chocolate bar with m × n squares of chocolate, and our task is to divide it into mn individual squares. We are only allowed to split one piece of chocolate at a time using a vertical or a horizontal break. 

For example, suppose that the chocolate bar is 2 × 2. The first split makes two pieces, both 2 × 1. Each of these pieces requires one more split to form single squares.This gives a total of three splits. 

Prove that the number of times you split the bar does not depend on the sequence of splits you make.

(a, b)

split along a at x:
(a, b) → (a - x, b), (x, b)

split along b at x:
(a, b) → (a, b - x), (a, x)

ideas:
- induction on $c = m * n$?
- P(c) means to split a bar with c squares, we need c - 1 splits

3 x 3 =
(2, 3), (1, 3)
(1, 3), (1, 3), (1, 3) each take 2x splits
(1, 2) (1, 1), (1, 3), (1, 3)
8 splits!

P(1) = trivial (0 splits)
P(2) = proven by cases (1 split)
...

**via strong induction**
if P(1) ... P(c) => P(c + 1):
idea: combining?

We can split to create an x sized piece (in either dimension, without loss of generality):
then we have a bar of $x$ squares, and a bar of $c + 1 - x$ squares

$x \leq c \implies P(x) = x - 1$ splits to turn into single squares
$x \leq c + 1 - x \implies P(x) = c + 1 - x - 1$ splits to turn into single square

$x - 1 + c + 1 - x - 1$ 
= $c - 1$

P(c + 1) is proven! So P holds via induction.

### Another idea:
Nested induction? Induct on $m$ then within that induct on $n$

P(1, 1) -> P(1, 2)
  |                  |
P(2, 1)-> P(2, 2) ?

P(m) = to split a m * n bar into m "sticks" of width 1, height n, takes m - 1 splits
(split vertically)
H(m) = to split a m * n bar into m "sticks" of height 1, width n, takes m - 1 splits
(split horizontally)

(these are basically the same but different direction of split, rotate the bar)

We split a m * n bar into 2 bars: 
- x and m - x widths, n heights (vertically)
- OR x and m - x height, n widths (horizontally)

P(m, x) = to split an m by x 

TODO: formalize in Lean with Florian

## Problem 2: Temple of Forever
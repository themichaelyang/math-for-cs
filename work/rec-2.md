# Recitation 2

## Problem 1

**By well ordering principle:**

Let P(n) be the case that 1 + … + $r^n$ is true for any r.

Also, let G(n, r) = 1 + … + $r^n$

P(0) and P(1) are trivially true for any r.

Assume theorem is false. Let set S = {all n in N; where P(n) is not true}

By Well Ordering, exists a natural number c in S that is the smallest element. Also, c > 1 because P(1) and P(0) are true.

Since c is the smallest element of S and c > 1, then P(c-1) must be true.

G(c, r) = G(c-1, r) + $r^c$

$\frac{1-r^c}{1-r}+ r^c$
$= \frac{1-r^c}{1-r} + \frac{r^c - r^{c+1}}{1-r}$
$= \frac{1 - r^{c+1}}{1-r}$

Which means P(c) is true, reaching contradiction. c is the smallest n where P(n) is not true!

**By induction**

Base case: see above.

Inductive step:
Given P(n), prove P(n+1)

G(n+1, r) = G(n, r) + $r^{n+1}$

This is the same as in the Well Ordering case.

## Problem 2

Hypothesis: 

- $p$ = starting purple
- $r$ = starting red
- $x$ = remaining purple
- $y$ = remaining red

(would this work if the announcer said at least 3 people have a purple eye? if p = 5 say?)

At the end of the $p$th day, all $p$ purple will leave.

All purples have same perspective of counts.
All reds have same perspective of counts.

From the perspective of a purple: I see $p-1$ purple. Can be either $p-1$ (I am red) or $p$ purples (I am purple).
From the perspective of a red: I see $p$ purple. Can be either $p$ (I am red) or $p +  1$ (I am purple).

$P(n):$ at the end of day n
1. If $p > n$: $x = p, y = r$ (nobody leaves)
2. If $p = n$: $x = p \rightarrow 0, y = r$ (purples all leave)
3. If $p < n$: $x = 0, y = r$ (purples already gone)

**Base case**
$P(1)$:
1. If $p = 1$: then, purple sees 0 purples, so they leave.
2. If $p < 1$: Not possible, so this is *vacuously* true.
3. If $p > 1$:
	1. purples see $p - 1 > 0$ purple, so they stay. 

**Inductive step**
Assume P(n) holds, prove P(n + 1)

Since $P(n)$ holds, this is true:
1. If $p = n$: $x = p \rightarrow 0, y = r$
2. If $p < n$: $x = 0, y = r$
3. If $p > n$: $x = p, y = r$

$P(n + 1)$: at the end of the day $n + 1$:
1. If $p = n + 1$: 
	1. Then $p > n$
	2. Then there are still people at end of nth day ($x = p, y = r$ at end of day $n$)
	3. Purples know $p > n$, based on the $P(n)$
	4. Perspective of a purple: $p$ could be either $n$ or $n + 1$
	5. So, purples realize $p = n + 1$
	6. All purples leave.
2. If $p < n + 1$:
	1. If $p > n$: not possible
	2. If $p = n$: then all purple already left
	3. If $p < n$: then all purple already left as well
	4. So, if $p < n + 1$ then $x = 0, y = r$
3. If $p > n + 1$
	1. Then $p > n$, so no people have left
	2. Purples see $z$ purples, know it could be either $z$ or $z + 1$.
	3. Purples don't gain any more information, so nobody leaves.








# Problem set 1

## Problem 1

**1a)**

$\exist x \in X$ such that $S(x) \land A(x)$

**1b)** 

$\forall x \in X$, $T(x) \land S(x) \implies A(x)$

**1c)** 

There are no people who are TA's who did not get A's.
$\iff$ Everyone who is a TA got an A.

$\nexists x \in X$ such that $T(x) \land A(x)$ 

$\iff \forall x \in X$, $T(x) \implies A(x)$

See page 18–19 of MCS 2010.

**1d)**

$\exists x, y, z \in X$ such that: $T(x) \land \lnot S(x) \land T(y) \land \lnot S(y) \land T(z) \land \lnot S(z) \land \lnot E(x, y) \land \lnot E(y, z) \land \lnot E(x, z)$  

e.g. $x, y, z$ are all TAs, did not take the class, and are different people.


## Problem 5

Prove: if $r$ is irrational then $r^{1/5}$ is irrational, via contrapositive.

$P \implies Q \iff \lnot Q \implies \lnot P$ (Contrapositive)

**Contrapositive:** if $r^{1/5}$ is not irrational, then $r$ is not irrational.

**Proof of contrapositive:**

$r^{1/5}$ is rational, so $r^{1/5} = a/b$ where $a, b \in \mathbb{Z}$.

$r = (r^{1/5})^{5} = (\frac{a}{b})^{5} = {a^5\over b^5}$

$a^5, b^5 \in \mathbb{Z} \implies$ r is rational. $\square$

(apparently, the $\square$ is called the tombstone/Halmos and is a reference to "end marks" in magazines [[wiki](https://en.wikipedia.org/wiki/Tombstone_(typography))]\)


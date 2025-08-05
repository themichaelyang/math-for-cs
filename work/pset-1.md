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

## Problem 6

Given $w^2 + x^2 +y^2 = z^2$ where $w,x,y,z \in \mathbb{Z}_{>0}$, prove that $z$ is even iff $w,x,y$ are even.

### Proof that (P) $z$ is even $\implies$ (Q) $w,x,y$ are even:

Given $z$ is even: $z = 2d$ where $d \in \mathbb{Z}_{>0}$

$w^2 + x^2 +y^2 = 4d^2$

#### Case 1: assume $w,x,y$ are odd

Then $w = 2a + 1$, $x = 2b + 1$, $y = 2c + 1$ where $a, b, c \in \mathbb{Z}_{>0}$

$w^2 = 4a^2 + 4a + 1$  
$x^2 = 4b^2 + 4b + 1$  
$y^2 = 4c^2 + 4c + 1$

$$
\begin{aligned}
z &= w^2 + x^2 +y^2 \\
&= 4a^2 + 4a + 1 + 4b^2 + 4b + 1 + 4c^2 + 4c + 1 \\
&= 4(a^2 + a + b^2 + b + c^2 + c) + 3
\end{aligned}
$$

Since $4(a^2 + a + b^2 + b + c^2 + c)$ is even, that $+ 3$ is odd. 
This is a contradiction, since $z$ is even. 

<!-- $\therefore$ if $z$ is even, $w,x,y$ are not all odd. -->

#### Case 2: assume, of $w,x,y$, 2 are odd, 1 is even

Without loss of generality, assume $w,x$ are odd and $y$ is even. 

Then $w = 2a + 1$, $x = 2b + 1$, $y = 2c$ where $a, b, c \in \mathbb{Z}_{>0}$

$w^2 = 4a^2 + 4a + 1$  
$x^2 = 4b^2 + 4b + 1$  
$y^2 = 4c^2$

$$
\begin{aligned}
z &= w^2 + x^2 +y^2 \\
&= 4a^2 + 4a + 1 + 4b^2 + 4b + 1 + 4c^2 \\
&= 4(a^2 + a + b^2 + b + c^2) + 2 \\
2d &= 4(a^2 + a + b^2 + b + c^2) + 2 \\
d &= 2(a^2 + a + b^2 + b + c^2) + \tfrac{1}{2}
\end{aligned}
$$

Since $1/2 \not\in \mathbb{Z}_{>0}$, this contradicts with $d \in \mathbb{Z}_{>0}$

<!-- $\therefore$ if $z$ is even, 2 of $w,x,z$ cannot be odd. -->

#### Case 3: assume, of $w,x,y$, 1 is odd, 2 are even

Without loss of generality, assume $w$ is odd and $x,y$ are even. 

Then $w = 2a + 1$, $x = 2b$, $y = 2c$ where $a, b, c \in \mathbb{Z}_{>0}$

$w^2 = 4a^2 + 4a + 1$  
$x^2 = 4b^2$  
$y^2 = 4c^2$

$$
\begin{aligned}
z &= w^2 + x^2 +y^2 \\
&= 4a^2 + 4a + 1 + 4b^2 + 4c^2 \\
&= 4(a^2 + a + b^2 + c^2) + 1
\end{aligned}
$$

Similar to case 1, this is a contradiction since $z$ is not odd.

#### Case 4: assume $w,x,y$ are even

Then $w = 2a$, $x = 2b$, $y = 2c$ where $a, b, c \in \mathbb{Z}_{>0}$

$w^2 = 4a^2$, $x^2 = 4b^2$, $y^2 = 4c^2$

$$
\begin{aligned}
z &= w^2 + x^2 +y^2 \\
&= 4a^2 + 4b^2 + 4c^2 \\
2d &= 4(a^2 + b^2 + c^2) \\
d &= 2(a^2 + b^2 + c^2) \\
\end{aligned}
$$

$\therefore$ if $z$ is even, $w,x,y$ can be even. 

Since this is the only case that is possible, $z \in 2\mathbb{Z}_{>0} \implies w,x,y \in 2\mathbb{Z}_{>0}$.

### Proof that Q $\implies$ P

Repeat Case 4, but take $w,x,y$ are even as given and don't assume $z$ is even.

Since $a^2 + b^2 + c^2 \in \mathbb{Z}_{>0} \implies z \in 2\mathbb{Z}_{>0}$ 

$\therefore P \iff Q$

$\square$

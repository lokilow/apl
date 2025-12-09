# Tacit Programming: Modifier Trains in J, BQN, and Uiua

A side-by-side comparison of combinators and tacit composition patterns across three array languages.

## Conceptual Overview

All three languages support "point-free" or "tacit" programming—defining functions by composing other functions without explicitly naming arguments. The mechanisms differ:

| Language | Model | Train Syntax |
|----------|-------|--------------|
| J | Trains (sequences of verbs) | `(f g h)` parsed by length/part of speech |
| BQN | Trains + explicit combinators | Trains + `∘ ○ ⊸ ⟜` modifiers |
| Uiua | Stack + modifiers | Stack-based with `⊃ ∧ ⊓ ⟜ ⊸` modifiers |

---

## Fork: Apply Two Functions, Combine Results

The fork pattern: given input `y`, compute `f(y)` and `h(y)`, then combine with `g`.

```
        y
       / \
      f   h
       \ /
        g
```

### Examples: Average (sum divided by length)

**J:**
```j
avg =: +/ % #
avg 1 2 3 4 5
NB. 3
```
Three verbs in a row form a fork: `(+/) % (#)` means "sum divided by length."

**BQN:**
```bqn
Avg ← +´÷≠
Avg 1‿2‿3‿4‿5
# 3
```
Three functions form a fork: `(+´) ÷ (≠)` — fold-sum divided by length.

**Uiua:**
```uiua
Avg ← ÷⊃(⧻)(/+)
Avg [1 2 3 4 5]
# 3
```
`⊃` (fork) calls both functions on the same input. Stack order: `/+` result on top, `⧻` below, then `÷`.

### Examples: Absolute Difference

Compute `|x - y|` for two arguments.

**J:**
```j
absdiff =: | @ -
absdiff/ 8 3
NB. 5
```
(This is atop, not fork—J uses fork for dyadic case differently.)

**BQN:**
```bqn
AbsDiff ← |∘-
8 AbsDiff 3
# 5
```

**Uiua:**
```uiua
AbsDiff ← ⌵-
AbsDiff 8 3
# 5
```
Simple composition—`-` then `⌵` (absolute value).

---

## Hook: Combine Argument with Transformed Argument

The hook pattern: given `y`, compute `g(y)`, then apply `f` to `y` and `g(y)`.

```
      y
      |\ 
      | g
      |/
      f
```

### Examples: Compare to Mean

Check which elements are greater than the average.

**J:**
```j
aboveavg =: > +/ % #
aboveavg 1 2 3 4 5
NB. 0 0 0 1 1
```
Two-verb sequence is a hook: `y > (avg y)`.

**BQN:**
```bqn
AboveAvg ← >⟜(+´÷≠)
AboveAvg 1‿2‿3‿4‿5
# ⟨0 0 0 1 1⟩
```
`⟜` (before/after depending on position) computes right side, passes to left with original.

**Uiua:**
```uiua
AboveAvg ← >⟜(÷⊃(⧻)(/+))
AboveAvg [1 2 3 4 5]
# [0 0 0 1 1]
```
`⟜` (on): compute the right function, then call left function with original value and result.

### Examples: Duplicate and Transform

Append an array to its reverse.

**J:**
```j
palindromish =: , |.
palindromish 1 2 3
NB. 1 2 3 3 2 1
```

**BQN:**
```bqn
Palindromish ← ∾⟜⌽
Palindromish 1‿2‿3
# ⟨1 2 3 3 2 1⟩
```

**Uiua:**
```uiua
Palindromish ← ⊂⟜⇌
Palindromish [1 2 3]
# [1 2 3 3 2 1]
```

---

## Atop / Compose: Simple Function Composition

Apply `g`, then apply `f` to the result: `f(g(y))`.

**J:**
```j
negsum =: -@(+/)
negsum 1 2 3 4
NB. _10
```
`@` is atop (monad composed with monad).

**BQN:**
```bqn
NegSum ← -∘(+´)
NegSum 1‿2‿3‿4
# ¯10
```
`∘` is atop.

**Uiua:**
```uiua
NegSum ← ¯/+
NegSum [1 2 3 4]
# ¯10
```
Just write them in sequence—stack-based composition is implicit.

---

## Over: Transform Both Arguments, Then Combine

For dyadic case: `g(x) f g(y)` — apply `g` to both arguments, combine with `f`.

**J:**
```j
NB. Compare lengths
samelength =: = & #
'hello' samelength 'world'
NB. 1
```
`&` (bond/compose) creates the "over" pattern.

**BQN:**
```bqn
SameLength ← =○≠
"hello" SameLength "world"
# 1
```
`○` is over: `≠` (length) applied to both, then `=`.

**Uiua:**
```uiua
SameLength ← =∩⧻
SameLength "hello" "world"
# 1
```
`∩` (both) applies the function to both arguments.

---

## Before / By: Transform One Argument

Apply a function to one argument before the main operation.

### Transform Left Argument

**J:**
```j
NB. Negate left, then add
f =: + & -
3 f 10
NB. 7  (because: (-3) + 10)
```

**BQN:**
```bqn
F ← -⊸+
3 F 10
# 7
```
`⊸` (before): transform left argument with `-`, then `+`.

**Uiua:**
```uiua
F ← +⊸¯
F 3 10
# 7
```
`⊸` (by): negate the first value, then add.

### Transform Right Argument

**J:**
```j
NB. Add to double of right
f =: + & (*: 2&*)
3 f 5
NB. 13  (3 + 2*5)
```
(J's approach here gets complex.)

**BQN:**
```bqn
F ← +⟜(2⊸×)
3 F 5
# 13
```
`⟜` (after): transform right with doubling, then `+`.

**Uiua:**
```uiua
F ← +⟜(×2)
F 3 5
# 13
```

---

## Bracket / Split Arguments

Apply different functions to different arguments.

**Uiua:**
```uiua
# Add first arg to double of second
F ← +⊙(×2)
F 3 5
# 13
```
`⊙` (dip) reaches past the top of stack. `⊓` (bracket) applies separate functions to separate arguments.

**BQN:**
```bqn
# No direct equivalent—use explicit or trains
F ← {𝕨 + 2×𝕩}
3 F 5
# 13
```

**J:**
```j
NB. Use explicit or caps
f =: [ + 2 * ]
3 f 5
NB. 13
```

---

## Comparison Table

| Pattern | J | BQN | Uiua |
|---------|---|-----|------|
| Fork (monadic) | `(f g h) y` | `(F G H) y` | `G⊃F‿H y` |
| Hook | `(f g) y` | `F⟜G y` | `F⟜G y` |
| Atop | `f@g` | `F∘G` | `FG` (implicit) |
| Over | `f&g` | `F○G` | `F∩G` |
| Before (left) | complex | `F⊸G` | `G⊸F` |
| After (right) | complex | `F⟜G` | `F⟜G` |
| Identity/Same | `]` or `[` | `⊢` or `⊣` | `∘` (identity) |
| Constant | `0:` etc. | `0˙` | `¤` (fix) |

---

## Mental Model Differences

**J** parses trains by length and part of speech. You must internalize the grammar: 3 verbs = fork, 2 verbs = hook, `[:` (cap) breaks sequences. The terseness is powerful but requires memorizing parsing rules.

**BQN** is more explicit. Combinators (`∘ ○ ⊸ ⟜`) are visually distinct modifiers. Trains still exist but combinators handle most cases more clearly. The documentation makes the semantics very precise.

**Uiua** thinks in terms of stack manipulation. Modifiers control how arguments flow to functions. The stack model means you reason about "what's on top" rather than "left vs right argument." Once you internalize stack flow, composition becomes spatial intuition.

---

## Recommendations

If you understand one, translating to another is mostly mechanical. Key transferable insights:

1. **Think in data flow.** Draw the diagram of how values move through functions.
2. **Identify the pattern first.** Fork? Hook? Over? Name it, then find that language's syntax.
3. **Build up from primitives.** Complex trains are just nested simple patterns.

The mathematical thinking—operating on whole arrays, composing transformations—is the same everywhere. Syntax is just notation.

# Chapter 6
# How can `equals` and `modulo` be used to identify the factors of N?
Factors ← ▽=0⤚◿⊸(+1 ⇡)
# Factors 13
# ⍤[1 13] Factors 13
# ⍤ [1 2 3 6] Factors 6
⍤⤙≍ [1 13] Factors 13
⍤⤙≍ [1 2 3 6] Factors 6

# You happen to have in storage a vector S of 4 positive elements.
# Use S to generate in at least 5 different ways:
# 1. A Vector Z of 4 zeros, 2. A vector W of 4 1s

S ← ⌈×10 ⍥⚂ 4

Z  ← ↧ 0 S
Z′ ← ˜↯ 0 ⧻ S
Z″ ← - .S
Z‴ ← -1 ÷ .S
⍤"All Zs are ones!"/×≡(≍ [0 0 0 0])[Z Z′ Z″ Z‴]
W  ← ↧1 S
W′ ← ˜↯ 1(⧻ S)
W″ ← ÷.S
W‴ ← +1-.S
⍤"All Ws are ones!"/×≡(≍ [1 1 1 1])[W W′ W″ W‴]

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

# Chapter 7
# Reduce
# / reduce works on arrays of arbitrary rank. The leading-axis rows will always be iterated over.
Sales ← ↯[4 5] [15 18 9 2 7 4 15 1 8 6 0 4 0 8 3 12 10 13 7 9]
⍤ ⤙≍[31 47 23 25 25] /+Sales # Sums across columns
⍤ ⤙≍ [51 34 15 51]≡/+ Sales  # Sums across rows

# / reduce ⊂ join is the simplest way to combine the first two dimensions of an array.
# ⊸/⊂↯2_2_4⇡16
# Numeric subscripted ≡ rows operates on rank-N subarrays.
Avg  ← ÷⧻ ⟜/+
Avg′ ← ÷⊃⧻ /+
⍤ "Avg of [9 1] is 5" = 5 Avg [9 1]
⍤ "Avg' of [9 1] is 5" = 5 Avg′ [9 1]

# Minus reduction
# Reduce goes from left to right. This is different from APL, which goes from right to left
\- [3 8 2 5] ## [3 5 ¯3 8] 
# you can reverse the list to get right to left
\- ⇌[3 2 1 4]

# Calculating Pi
×4/-⇌˜÷ 1+1×2⇡ 1000000 ## 3.1415916535897934 

# Set up an algorithm in APL to calculate the area of a triangle by Hero's formula
# Semiperimeter ← ÷ 2/+
# Hero          ← √/×⊂⤙-⟜Semiperimeter
Hero ← √/×⊂⤙-⟜(÷2/+)
⍤ "Area of [3 4 5] is 6" = 6Hero [3 4 5]

# Chapter 18
# Compression
# L ← [51 63 61 65 59 62]
# The "0 1 1 0 0 0" compression of L is [63 61]
# In Uiua, we use the ▽ keep operator
# ▽ [0 1 1 0 0 0] L

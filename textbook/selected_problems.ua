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

# Chapter 8
# How can we model the polynomial function 4x^3 + 9x^2 -2x + 3
X            ← 10
Powers       ← 3_2_1_0
Coefficients ← 4_9_¯2_3
/+× Coefficients ⁿ Powers X

# Write an APL expression to compute the root-mean-square of the elements of a vector.
RMS ← √÷⊃(⧻|/+ⁿ2)

⁅₂RMS [1 2 3 4]

# Construct an APL expression that will yield a value A id A is greatrer than B, otherwise 0
Fn ← ⊡⊃(˜>|⊂ 0)
⍤ "A = 10 B= 20 gives 0" = 0 Fn 10 20
⍤ "A = 10 B=5 gives 10" = 10 Fn 10 5

# Chapter 9
# Write an algorithm to test an integer N for the following:
# if the final digit is deleted, the original number is divisible by the new one
IsDivisible ← =⊸⌊÷⊸(⌊ ÷ 10)

⍤ "120 is divisible by 12" = 1 IsDivisible 120
⍤ "123 is divisible by 12" = 0 IsDivisible 123

# Write an expression to construct a 4x4 matrix made up of random integers in the range 1 to 100
# Here are 3 ways

M  ← ˙⊞⋅⋅⚂₁₀₀↯ [4 4]
M′ ← ↯ [4 4]⍥⚂₁₀₀ 16
M″ ← ⌊×100 ↯[4 4] gen 16

# A certain number N may be either positive or negative.
# Write a one-line expression to compute its square root if it is positive or its square if it is negative.
SqOrSqrt ← ⁿ(˜ⁿ2¯) ⊸±
⍤ "Square of -2 is 4" = 4 SqOrSqrt ¯2
⍤ "Sqrt of 36 is 6" = 6 SqOrSqrt 36

# Chapter 10
# Define a function EQ which evaluates the expression (X - 2)(X - 3)
EQ ← /×+[¯2 ¯3]
⍤ "(10 -2)(10 - 3) is 56" = 56 EQ 10
# A well known formula (Ohm's Law) in electrical work gives the combined resistance (RT)
# of several resistances R1, R2, etc, wired in parallel as 1/RT = 1/R1 + 1/R2
# Define a function PR that calculates RT for a vector M of resistances in parallel
PR ← ˜÷1/+˜÷ 1
⍤ ⤙= 2 PR [5 5 10]

# To find the standard deviation of a set of numbers, the following steps are necesary:
# 1: Compute the mean 2: Find the difference of each number from the mean
# 3: Square the differences 4: Take the square root of the average of step 3.
# Write a function SD that computes the standard deviation of some data X
Avg ← ÷ ⊃⧻/+
⍤ ⤙=5Avg [2 4 6 8]
SD ← √Avg˙×-⊸Avg
⍤ ⤙= 2 SD [1 2 3 4 5 6 7]

# Chapter 18
# Compression
# L ← [51 63 61 65 59 62]
# The "0 1 1 0 0 0" compression of L is [63 61]
# In Uiua, we use the ▽ keep operator
# ▽ [0 1 1 0 0 0] L

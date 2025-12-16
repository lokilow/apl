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
◌
# you can reverse the list to get right to left
\- ⇌[3 2 1 4]
◌

# Calculating Pi
×4/-⇌˜÷ 1+1×2⇡10000000 ## 3.1415925535897933 
◌

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
◌

# Write an APL expression to compute the root-mean-square of the elements of a vector.
RMS ← √÷⊃(⧻|/+ⁿ2)

⁅₂RMS [1 2 3 4] ## 2.74 
◌

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
⍤⤙≍ 5 Avg [2 4 6 8]
SD ← √Avg˙×-⊸Avg
⍤⤙≍ 2 SD [1 2 3 4 5 6 7]

# Chapter 16
# Write one-line monadic functions returning an explici result to give
# A) The sum of the square root of first N positive integers
A ← /+√+1⇡
# B) The square root of the sum of the first N positive integers
B ← √ /+⇡
# C) The geometric mean of the first N positive integers
C ← ⁿ⊃(˜÷1) (/×+ 1⇡) # would be better to use a fraction, or pass N all the way through the stack?
⍤ ⤙≍ 2.213 ⁅₃C 4

# Write an expression to generate a vector of 50 1s
Exp  ← ↯ 50 1
Exp′ ← ˙÷+1⇡ 50

# Write functions that would approximate each of the following series to N terms:
# A) 1 - 1/2 + 1/3 - 1/4 + ...
A ← \-˜÷ 1 + 1 ⇡

# B) 1/0! + x^1/1! + x^2/2!
# We'll say arg order is B X N
Fact ← /×+1⇡
B    ← /+÷≡Fact⤙(˜ⁿ)⊙⇡
⍤ ⤙≍ 5 B 2 3
# What if the args were flipped? Much better.
# Can I gain intuition for stack argument ordering like this?
B′ ← /+÷≡Fact⟜ⁿ⇡
⍤ ⤙≍ 5 B′ 3 2

# Write an expression that yields 1 if the array A is scalar, 0 otherwise
EXP ← ≍ [] △
⍤⤙≍ 1 EXP 2
⍤⤙≍ 0 EXP [1 2 3]

# Write an expression to cause 3 2s to be printed out in a vertical column
↯ [3 1] 2 ## ╭─    
          ## ╷ 2   
          ##   2   
          ##   2   
          ##     ╯ 
◌

# Select 100 random positive integers, none of which is greater than 10
⍥⚂₁₀10 ## [0 8 9 0 4 7 5 1 0 7] 
◌
≡⋅⚂₁₀ ⇡ 10 ## [9 6 0 6 9 9 4 0 3 7] 
◌

# Construct the array:
\+↯ [4 4] 1 ## ╭─          
            ## ╷ 1 1 1 1   
            ##   2 2 2 2   
            ##   3 3 3 3   
            ##   4 4 4 4   
            ##           ╯ 
◌
# Chapter 17 (Character Data)
# Define a function F which takes a single argument A and prints its shape, rank, and number of elements with appropriate
# descriptive messages
F ← $"Shape: _, rank: _, number of elements: _" ⊃(△|⊢△ △|/×△)
F ↯ [2 3 4] 1
# To print:
&p

# Chapter 18
# Compression
# L ← [51 63 61 65 59 62]
# The "0 1 1 0 0 0" compression of L is [63 61]
# In Uiua, we use the ▽ keep operator
# ▽ [0 1 1 0 0 0] L
#
# Specify D:
D ← [¯2.1 4 1.9 0 ¯1 ¯4 ¯1.4 0.7 2.5 2]
# Select components:
# less than 0.5
▽⊸< 0.5 D ## [¯2.1 0 ¯1 ¯4 ¯1.4] 
# equal in magnitude to 4
▽⊸(=4⌵) D ## [4 ¯4] 
# less than 1 and greater than or equal to `2 (double filter)
▽⊸≥¯2▽⊸<1 D ## [0 ¯1 ¯1.4 0.7] 
# negative and greater than `2 (fork AND)
▽⊸(×⊃(=¯1±|> ¯2)) D ## [¯1 ¯1.4] 
◌◌◌◌
# Define a monadic function to insert the character '-' between each pair of adjacent elements in a vector V
V ← "abcdefg"
↘¯1 ⬚@-⌝▽ [1 0] V ## "a-b-c-d-e-f-g" 
◌
# For an arbitrary vector V write a function INCR to compute the increments between adjacent elements
X    ← [1 2 3 4 6 8 10 20 30 40] ## [1 2 3 4 6 8 10 20 30 40] 
INCR ← -⊃(↘ ¯1|↘ 1)
INCR X ## [1 1 1 2 2 2 10 10 10] 
# Even better, use stencil!
INCR′ ← ⧈-
INCR′ X ## [1 1 1 2 2 2 10 10 10] 
◌◌
# Challenge:
# Obtain the area under the curve Y=3X^2 between X1 and X2 by breaking it up into rectangles of width I in that interval.
# Hint: First define F to compute 3*X^2
F         ← × 3 ⁿ2
INTERVALS ← +⊢⟜(×⊸(⇡+1˜÷/-))
AREA      ← ⧈-F INTERVALS
AREA [0 10] 2 ## [12 36 60 84 108] 
/+            ## 300 
◌

# Construct an expression that selects the largest element in a three-element vector V and prints a 1 if it exceeds the sum of the remainng two elements, otherwise it prints 0.
NOTRIANGLE ← > ⤚- /↥ ⟜/+
NOTRIANGLE [5 5 13]  ## 1 
NOTRIANGLE [5 12 13] ## 0 
◌ ◌

# Show how to select the elements with even indices in a vector Y
EvenIndices ← ▽ [1 0]              ## [1 3 5 7 9] 
EvenIndices [1 2 3 4 5 6 7 8 9 10] ## [1 3 5 7 9] 
◌

# Given a sorted array of numbers, construct an expression to insert a given scalar S into the array so that it is still in ascending order. Be sure to handle the case where S is identical to some element in X
F ← ⊂⊂⊃(▽⊸<|∘|▽⊸≥)
F 30 ⇡ 20    ## [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 30] 
F 15 ×2 ⇡ 20 ## [0 2 4 6 8 10 12 14 15 16 18 20 22 24 26 28 30 32 34 36 38] 
◌◌

# Write an expression which returns the index of the larges element in a vector W.
LargestIndex ← ⊢⊚=⊸(/↥⍆)
LargestIndex [2 4 5 6 8 10 4] ## 5 
LargestIndex [3 10 2 5]       ## 1 
◌◌

# Define a function to remove all duplicates from a vector
# deduplicate is a primitive
Deduplicate ← ◴                     ## [1 2 3 4 5 6] 
Deduplicate [1 2 3 4 5 1 2 3 4 5 6] ## [1 2 3 4 5 6] 
◌
# Use occurrences: Mark each row of an array with its occurrence count
# Each row in the array becomes a number corresponding to the number of times it has already appeared in the array.
# When it is equal to 0, it is the first occurrence of a character
Deduplicate′ ← ▽⊸(=0⧆)       ## [1 2 3 4] 
Deduplicate′ [1 2 2 2 3 3 4] ## [1 2 3 4] 
◌

# Write a program SELECT which takes two arguments and will print that element in the left argument X whose position corresponds to the position of the largest element in the right argument Y.
#
# Define a function that takes a literal argument and selects the longest word in it.
# Make sure it handles multi line strings.
#
# Write an expression to delete all occurrences of the letter 'A' from a literal vector 'W'
#
# A vector A contains the ages of all employees in Sharp Ascociates. Define a function that will yield the the two ages which are closest to one another.
#
#  From an arbitrary matrix M ← ↯ [5 5] ⇡ 25 show how to obtain:
# The first 3 rows of M
# The four elements in the upper left corner
# The last 2 columns of M
# The four corner elements
#
# Sales Problem!
#
# Sales Problem 2!

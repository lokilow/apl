# Chapters 11-15 deal with defining and editing APL
# functions, local and global variables, and managing the APL workspace.
# Software has changed a lot since 1970, in this file I will explore
# Uiua functions and modules, and any other related concepts.

# Bindings
# Binding names can contain upper and lower alpha characters, emojis, subscripts, primes
# User defined bindings must start with an upper case, should be PascalCase
Sha₂₅₆ ← "Some function"
X      ← "equation"
X′     ← "deriviative of equation"

# Binding Functions
# If the code on the right of the ← takes more than 0 arguments, it will be bound as a function
Cube ← ˙(××)
Cube 2 ## 8 
◌

# You can surround an expression that takes 0 args with () to make it a function
Rand ← ⚂
[Rand Rand]
◌
Rand′ ← (⚂)
[Rand′ Rand′]
◌

# Modifiers
# Arry modifier change how operations work on arrays
# The table modifier applies a function to all combinations of rows of 2 arrays
# The rows modifer applies the function to the rows of an array
# And we know about scan and reduce. And there is planet notation...another file

# Inline functions
# Wrapping code in () allows a modifier to act upon all of the code as one entity,
# creating a moe complex function. This is called an inline function
# Inline functions may span multiple lines. The function runs line by line from top to bottom
# (As opposed to multiline array notation...??? gotta look this up)

F ← (
  ˙⊞=⇡
  ↥⊸⇌
)
F 3
◌
# There are no local bindngs! You can not create a binding inside a multiline function
# Actually, it seems you can bind a function. Maybe the docs are out of date. Well, you can't capture a variable.
# It just work on the stack
G ← (
  A ← + 10
  + A A # Needs 2 args on the stack,
)
G 5 10 ## 35 
◌

# TODO
# Signatures

# Modules

# Macros! Heck Yeah!

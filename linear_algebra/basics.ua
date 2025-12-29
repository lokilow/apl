M₁ ← [1_¯2 1_0]
M₂ ← [0_2 1_0]

# × M₁ M₂

# Matrix multiplication
# There has to be a cleaner way to do this...
⍉⊟∩(/+× ⍉M₂)⊃(⊢|⊣)⍉M₁ ## ╭─       
                      ## ╷ 2  0   
                      ##   1 ¯2   
                      ##        ╯ 

Data     ← &fras "1-1.input.txt"
Lines    ← ⊜□⊸≠ "\n"Data
ToNumber ← ⨬¯∘⊃(=@L⊢|⋕ ↘ 1)
°□/+=0◿ 100 + 50\+⍚ToNumber Lines

Data     ← &fras "1-1.example.txt"
Lines    ← ⊜□⊸≠ "\n"Data
ToNumber ← ⨬¯∘⊃(=@L⊢|⋕ ↘ 1)
Ints     ← + 50\+ ⍚ToNumber Lines
IntsTwo  ← \+ ⊂ 50 ⍚ToNumber Lines
# \⌊÷ 100 Ints
A ← 1_2_3_4_5
A
\(×+1) A
Ints
IntsTwo
⌵\-⌵⌊÷100 IntsTwo

A ← +1 ⇡ 4
⊞+ A A

↥ 3 5
⧻⧅< 2 ⇡ 4

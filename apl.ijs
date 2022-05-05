NB. Chapter 3
NB. 1. On one line, assign the vector 3 4 5 6 7 to a and make b = twice a
b=:2*a=:3 4 5 6 7

NB. 3. Construct a matrix m with 5 rows and 3 columns, consisting entirely of the number 7.  and q, which is the same size but whose rows contain 4 9 11
m=:5 3$7
q=:5 3$ 4 9 11


NB. 4. Convert the matrix m into a matrix n of all 1s in at least 2 different ways
m1=:m%7
m2=:m-6
m3=:m=m
m4=:m%m

NB. 5. A store sells 3 items, a b c.  over a week, the amounts sold are 8 15 7.  The following week the sales are 12 4 0.  The prices from week 1 are 3.10,
NB. 2.00, 4.17, and week 2 they are 3.50, 2.75, 4.35.  Put the sales data into a matrix s and the price data into a matrix p and use it to construct a table of total sales revenue by item over the 2 week period.
w1amounts=:8 15 7
w2amounts=:12 4 0
w1prices=:3.10 2.00 4.17
w2prices=:3.50 2.75 4.35
s=:2 3$w1amounts , w2amounts
p=:2 3$w1prices , w2prices
totalSales=:s*p


NB. Chapter 4
NB. How can I make four1 a function that prints
NB. the problem, and then the solution?


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

NB. Outer Product a x/ b (example: a */ b or a +/ b
NB.   1 2 +/ 3 4 5
NB. 4 5 6
NB. 5 6 7


NB. 3. Given a cube of whose edges have legth L.  Calculate the surace area for l =. 3 7 15 2.7
saCube=:6**:
l=:3 7 15 2.7
fourThree=:saCube l


NB. 4. specify a=. 1 2 3 4 and d=. 3 * a.  Find the outer product of a and d with multiplication, and the outer product of d and a using the power function.
d=:3*a=:1 2 3 4
fourFourOne=:d*/a
fourFourTwo=:a^/d

NB. 5. Use the outer product to generate a table of squares and square roots of the integers 1 through 5.
NB. I am not sure what the author meant by a table...maybe just the powers?  The answers below give the squares and square roots only
fourFiveOne=:(1+i.5)^/2
fourFiveTwo=:(1+i.5)^/(%2)

NB. 6. Express the number of seconds in the year (365 days) in scaled notation
NB. seconds = 365*24*60*60 = 31536000
fourSix=:3.15636e7

NB. 7. A journeyman snail finishing his apprenticeship is now allowed by the union to travel at a snail's pace (12 ft. per day).  Express this in mph.
fourSeven=:(12%5280)%24
fourSevenAlt=:12%5280*24


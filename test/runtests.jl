using DualNumbers
using Test

x = Dual(1,2)
y = Dual(2,3)

z = x+y
@test z == Dual(3,5)
@test -x == Dual(-1,-2)

@test x+y == Dual(3,5)
@test x-y == Dual(-1,-1)

@test 4*x == Dual(4,8)
@test x*3 == Dual(3,6)

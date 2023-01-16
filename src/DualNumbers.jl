module DualNumbers

export Dual

"""
	Dual: a dual number
"""
struct Dual{T}
	real::T
	dual::T
end
# negation
Base.:-(x::Dual) = Dual(-x.real, -x.dual)

# binary operators
Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)
Base.:-(x::Dual, y::Dual) = x + -y

# scalar multiplication
Base.:*(a::Number, x::Dual) = Dual(a*x.real, a*x.dual)
Base.:*(x::Dual, a::Number) = Dual(x.real*a, x.dual*a)

# multiplication
Base.:*(x::Dual, y::Dual) = Dual(x.real*y.real, x.real*y.dual + x.dual*y.real)

# conjugate
Base.conj(x::Dual) = Dual(x.real, -x.dual)

# inverse
Base.inv/(x::Dual) = conj(x)*(1/x.real^2)

# division
Base.:/(x::Dual, y::Dual) = x*inv(y)


end # module DualNumbers

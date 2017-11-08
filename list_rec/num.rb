require "matrix"

mat0 = Matrix[[2, 0, 0], [0, 2, 0], [0, 0, 2]]
mat1 = Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
mat2 = Matrix[[4, 5, 6], [7, 8, 9], [1, 2, 3]]

p mat0 + mat1
p mat0 - mat1
p mat1 * mat2

#require "rational"
x = Rational(1, 5)
y = x+ x
z = y * 2
n = z + x
p n

p 3.to_r

n = 3.quo(5)
p n

#require "complex"
a = Complex(3, 5)
p a
b = Complex.polar(3, 5)
p b

a = Complex(3, 5)
b = Complex(2, -2)
p a * b

a = Complex(3, 5)
p a.real
p a.image

p Complex(16, 4).conjugate


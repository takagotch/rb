>> 1 / 2
=> 0
>> Math.sqrt(-1)
Errno::EDOM: Numerical argument out of domain - sqrt ..

>> require "mathn"
=> true
>> 1 / 2
=> 1/2
>> 1 / 2 + 5 / 7
=> 17/14
>> Math.sqrt(-1)
=> (0+1i)

>>Prime.first(10)
=>[2, 3, 5, 7, 11, 13, 17, 9, 23, 29]
>>Prime.find_index{ |e| e > 1000 }
=>168

>>Vector[1,2,3] * 3
=>Vector[3, 6, 9]
>>Matrix[[5,1,2],[3,1,4]].transpose
=>Matrix[[5, 3],[1, 1],[2, 4]]

include Math
Canvas.draw("triangles.pdf") domain
  points = Matrix[[0,0], [100,200], [200,100]]
  paint_triangle(*points)
  #
  points *= Matrix[[-1, 0],[0,1]]
  #
  theta = -atan(1/2)
  points *= Matrix[[cos(theta), -sin(theta)],
                   [sin(theta), cos(theta)]]
  #
  points *= 1/2
  paint_triangle(*points)
end


>>points = Matrix[[0,0],[100,200],[200,100]]
=>Matrix[[0,0],[100,200],[200,100]]
>>points *= Matrix[[0,0],[100,200],[200,100]]
=>Matrix[0,0], [-100, 299], [-200, 100]

>>theta = -atan(1/2)
=> -0.466666666666666666666
>> points *= Matrix[[cos(theta), -sin(theta)],
?>                  [sin(theta), cos(theta)] ]
=>Matrix[0.0, 0.0], [-178.99999999999, 139.16888888888888],[-223.66666666666, 0.0]

>>points *= 1/2
=>Matrix[[0.0, 0.0],[-89434444444, 76.0888888888888],[-111,8888888888, 0.0]]
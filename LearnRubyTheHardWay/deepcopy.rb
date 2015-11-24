a = [ [1,2] ]
b = Marshal.load( Marshal.dump(a) )
a[0] << 3
puts a.inspect

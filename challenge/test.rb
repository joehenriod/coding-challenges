a = ["L","Z","J"].collect{|x| puts x.succ} #=> M AA K 
p a  #=> Array

b = ["L","Z","J"].each{|x| puts x.succ} #=> M AA K
p b
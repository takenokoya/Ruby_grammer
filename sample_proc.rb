# Procクラスはブロックをオブジェクト化するためのクラス
hello_proc = Proc.new { puts 'Hello!' }
# Procオブジェクトを実行するにはcallメソッドを使う
hello_proc.call
puts '#######'

# 実行時に引数を利用するProcオブジェクトも生成可能
add_proc = Proc.new { |a, b| puts a + b }
add_proc.call(10, 20)
puts '#######'

# デフォルト引数や可変長引数、キーワード引数も利用可能
add_proc = Proc.new { |a = 0, b = 0| puts a + b }
add_proc.call(10)
puts '#######'
add_proc = Proc.new { |*array| puts array.inject(0) { |sum, i| sum + i } }
add_proc.call(10, 20, 30, 40, 50)
puts '#######'
add_proc = Proc.new { |a, b, is_num: false| puts a + b if is_num }
add_proc.call(20, 30, is_num: true)
puts '#######'

# ProcクラスのcallメソッドではなくKarnelモジュールのprocメソッドを使うことも可能
add_proc = proc { |a = 0, b = 0| puts a + b }
add_proc.call(30, 40)
puts '#######'

# procオブジェクトを生成するための4つの方法
a = Proc.new { |a, b| a + b }
b = proc { |a, b| a + b }
c = ->(a, b) { a + b } # lambda
d = lambda { |a, b| a + b } # lambda
puts a
puts b
puts c
puts d

# Proc.new と lambda の違い
# Proc.new の場合
add_proc = Proc.new { |a, b| puts a.to_i + b.to_i }
add_proc.call(10, 20)
# Proc.new の場合は引数が少ないまたは多い場合でも実行可能。足りないまたは余分な引数は無視される
add_proc.call(10)
add_proc.call(10, 20, 30)
add_proc.call
# lambda は Proc.new よりも引数のチェックが厳密
add_lambda = ->(a, b) { puts a.to_i + b.to_i }
add_lambda.call(10, 20) # OK
# lambda は引数が多かったり少なかったりした場合は ArgumentError
#add_lambda.call
#add_lambda.call(10)
#add_lambda.call(10, 20, 30)

puts add_proc.class
puts add_proc.lambda?

puts add_lambda.class
puts add_lambda.lambda?
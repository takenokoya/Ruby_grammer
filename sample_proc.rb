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
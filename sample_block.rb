def greeting_common(texts, &block)
  puts texts[0]
  # callメソッドを使ってブロックを実行
  puts block.call(texts[1])
  # 引数のブロックはprocオブジェクトである
  puts block.class
  puts texts[2]
  puts '########'
end

def greeting_ja(&block)
  texts = ['おはよう', 'こんにちは', 'こんばんは']
  greeting_common(texts, &block)
end

def greeting_en(&block)
  texts = ['good morning', 'hello', 'good night']
  greeting_common(texts, &block)
end

# 引数にブロックを渡す
greeting_ja do |text|
  text * 2
end

greeting_en do |text|
  text.upcase
end


def greeting(&block)
  text =
    if block.arity == 1
      # arityメソッドはブロック引数の個数をカウントする
      # arityメソッドはProcクラスのインスタンスメソッドである
      yield 'an apple'
    elsif block.arity == 2
      yield '2個', 'です'
    end
  puts text
end

# 1個のブロック引数でメソッド呼び出し
greeting do |t|
  t.upcase
end

# 2個のブロック引数でメソッド呼び出し
greeting do |text, word|
  text * 2 + word * 2
end

# 引数にブロックではなくProcクラスのオブジェクトを渡すこともできる
repeat_proc = Proc.new { |text| (text + "\n") * 2 }
# Karnelモジュールのメソッドを使ってもProcオブジェクトは生成できる
# repeat_proc = proc { |text| (text + "\n") * 2 }
# Procオブジェクトをブロック引数として渡すときはブロックを渡すときと同様に & をつける
greeting(&repeat_proc)

# 3種類のprocオブジェクトを受取り、それぞれのあいさつに適用するgreetingメソッド
# ブロック引数(&block)は1つまでしか渡せないかつ最後に渡さなければならない制約があるが、procオブジェクトを普通の引数として渡す分には制約はない
def greeting_proc(proc1, proc2, proc3)
  puts proc1.call('おはよう')
  puts proc2.call('こんにちは')
  puts proc3.call('こんばんは')
end

shuffle_porc = Proc.new { |text| text.chars.shuffle.join }
repeat_proc = Proc.new { |text| text * 2 }
question_proc = Proc.new { |text| "#{text}?"}

# 3種類のprocオブジェクトをmethodにわたす
greeting_proc(shuffle_porc, repeat_proc, question_proc)
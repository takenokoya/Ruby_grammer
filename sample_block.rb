def greeting_common(texts, &block)
  puts texts[0]
  # callメソッドを使ってブロックを実行
  puts block.call(texts[1])
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
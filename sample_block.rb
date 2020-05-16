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



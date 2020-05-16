class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    @effects.inject(original_words) do |words, effect|
      effect.call(words)
    end
  end

  module Effects
    def self.reverse
      # procオブジェクトをメソッドの戻り値にする
      ->(words) { words.split(' ').map(&:reverse).join(' ') }
    end
  end

  synth = WordSynth.new
  puts synth.play('Ruby is fun!')

  # リバースエフェクトを適用
  synth.add_effect(Effects.reverse)
  puts synth.play('Ruby is fun!')
end

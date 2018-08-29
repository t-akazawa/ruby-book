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
end

module Effects
  def self.reverse
    proc do |word|
      word.reverse!
    end
  end

  def self.echo(count)
    proc do |word|
      word.chars.map { |s| s * count }.join('').gsub(/\s+/, "\s")
    end
  end

  def self.loud(count)
    proc do |word|
      word.upcase.scan(/\S+/).map { |s| "#{s}#{'!' * count}" }.join(' ')
    end
  end
end

synth = WordSynth.new
# synth.add_effect(Effects.reverse)
# synth.add_effect(Effects.echo(2))
# synth.add_effect(Effects.loud(3))

synth.play('Ruby is fun!')

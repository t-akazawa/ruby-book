require './spec/spec_helper'
require './lib/word_synth'

RSpec.describe 'WordSynth' do
  describe '#play' do
    it 'checks Effect.reverse' do
      synth = WordSynth.new
      synth.add_effect(Effects.reverse)
      expect(synth.play('Ruby is fun!')).to eq '!nuf si ybuR'
    end

    it 'checks Effect.echo' do
      synth = WordSynth.new
      synth.add_effect(Effects.echo(2))
      expect(synth.play('Ruby is fun!')).to eq 'RRuubbyy iiss ffuunn!!'
    end

    it 'checks Effect.echo && Effect.loud' do
      synth = WordSynth.new
      synth.add_effect(Effects.echo(2))
      synth.add_effect(Effects.loud(3))
      expect(synth.play('Ruby is fun!')).to eq 'RRUUBBYY!!! IISS!!! FFUUNN!!!!!'
    end
  end
end
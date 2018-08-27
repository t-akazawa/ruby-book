require './spec/spec_helper'
require './lib/convert_length'

RSpec.describe 'Convert Length' do
  describe '#to_hex' do
    it 'returns valid float' do
      expect(convert_length(15, from: 'in', to: 'm')).to eq 0.38
      expect(convert_length(35000, from: 'ft', to: 'm')).to eq 10670.73
      expect(convert_length(35000, from: :ft, to: :m)).to eq 10670.73
    end
  end
end
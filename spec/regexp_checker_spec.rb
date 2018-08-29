require './spec/spec_helper'
require './lib/regexp_checker'

RSpec.describe 'regexp_checker' do
  describe 'exception not occurred' do
    it 'matched' do
      # use mock of stdin from command line.
      allow(Regex_checker).to receive(:receive_text).and_return('123-456-789')
      allow(Regex_checker).to receive(:receive_pattern).and_return('[0-9]+')
      expect(Regex_checker.call).to eq 'Matched: 123, 456, 789'
    end

    it 'nothing matched' do
      allow(Regex_checker).to receive(:receive_text).and_return('123-456-789')
      allow(Regex_checker).to receive(:receive_pattern).and_return('[a-z]+')
      expect(Regex_checker.call).to eq 'Nothing matched.'
    end
  end

  describe 'exception occurred' do
    it 'occurred exception pattern' do
      Regex_checker.setcount = 2
      allow(Regex_checker).to receive(:receive_text).and_return('123-456-789')
      allow(Regex_checker).to receive(:receive_pattern).and_return('[0-+')
      # 無限ループしてしまい、テストがうまく行かないので無理やり実装を変更してしまった。。
      expect(Regex_checker.call).to eq 'retry full.'
    end
  end
end
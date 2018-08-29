require './spec/spec_helper'
require './lib/convert_hash_syntax'


RSpec.describe 'Convert hash syntax' do
  describe '#convert_hash_syntax' do
    it 'converts old syntax to new syntax of hash' do
      EXPECTED_HASH = <<~TEXT
      {
        :name: 'Alice',
        :age: 20,
        :gender: :female,
      }
      TEXT

      OLD_HASH = <<~TEXT
      {
          :name => 'Alice',
        :age=>20,
         :gender  =>  :female,
      }
      TEXT
      expect(convert_hash_syntax(OLD_HASH)).to eq EXPECTED_HASH
    end
  end
end
require './spec/spec_helper'
require './lib/deep_freeze'

class Team
  COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end

class Bank
  CURRENCIES = deep_freeze({ 'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' })
end

RSpec.describe 'check deeply frozen' do
  describe 'Team' do
    it 'checks array of Team::COUNTRIES' do
      expect(Team::COUNTRIES.frozen?).to be_truthy
      expect(Team::COUNTRIES.all?(&:frozen?)).to be_truthy
    end
  end

  describe 'Bank' do
    it 'checks hash of Bank::CURRENCIES' do
      expect(Bank::CURRENCIES.frozen?).to be_truthy
      expect(Bank::CURRENCIES.each {|k, v| k.frozen? && v.frozen?}).to be_truthy
    end
  end
end
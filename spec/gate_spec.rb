require './spec/spec_helper'
require './lib/gate'

RSpec.describe 'calculate fare' do
  let(:ticket) { Ticket.new(t_params) }
  let(:umeda) { Gate.new(:umeda) }
  let(:mikuni) { Gate.new(:mikuni) }

  describe 'false case' do
    let(:t_params) { 150 }
    it 'pay 150 yen & goes umeda to mikuni' do
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to be_falsey
    end
  end

  describe 'true case' do
    let(:t_params) { 190 }
    it 'pay 190 yen & goes umeda to mikuni' do
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to be_truthy
    end

    it 'pay 190 yen & goes umeda to umeda' do
      umeda.enter(ticket)
      expect(umeda.exit(ticket)).to be_truthy
    end
  end
end
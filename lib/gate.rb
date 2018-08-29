class Ticket
  def initialize(payment)
    @balance = payment
  end

  def enter(name)
    @enter = name
  end

  attr_reader :balance

  def enter_station
    @enter
  end
end

class Gate
  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.enter(@name)
  end

  def exit(ticket)
    h = {
      umeda: { umeda: 0, juzo: 150, mikuni: 190 },
      juzo: { juzo: 0, mikuni: 150 }
    }
    fare = h[ticket.enter_station][@name]
    ticket.balance - fare >= 0
  end
end

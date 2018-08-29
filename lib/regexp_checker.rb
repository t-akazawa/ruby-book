module Regex_checker
  def self.call
    print 'Text?: '
    @text = self.receive_text
    @count ||= 100
    self.regexp_check
  end

  def self.setcount=(cnt)
    @count = cnt
  end

  private
  def self.receive_text
    gets.chomp
  end

  class << self
    alias_method :receive_pattern, :receive_text
  end

  def self.regexp_check
    count = 0
    begin
      print 'Pattern?: '
      @pattern = self.receive_pattern
      matched = @text.scan(/#{@pattern}/)
      if matched.empty?
        'Nothing matched.'
      else
        "Matched: #{matched.join(', ')}"
      end
    rescue RegexpError => e
      count += 1
      puts "Invalid pattern: #{e.message}"
      # implementation of outside specifications.
      if count < @count
        retry
      else
        'retry full.'
      end
    end
  end
end

#Regex_checker.setcount = 2
#Regex_checker.call

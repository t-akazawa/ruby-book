def to_hex(*arg)
  "##{arg[0..2].map { |n| sprintf(format('%02x', n)) }.join}"
end

def to_ints(arg)
  # arg =~ /#(..)(..)(..)/
  # [$1, $2, $3].map {|n| n.to_i(16)}
  arg.scan(/\w\w/).map(&:hex)
end

# p to_hex(4,60,120,4)
# p to_ints('#00fff1')

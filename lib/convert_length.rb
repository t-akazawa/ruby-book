UNITS = { m: 1.00, ft: 3.28, in: 39.37 }
def convert_length(length, from:, to: )
  unit = UNITS
  ( ( length * unit[to.to_sym] ) / unit[from.to_sym] ).round(2)
end

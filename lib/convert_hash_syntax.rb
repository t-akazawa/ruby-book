def convert_hash_syntax(hash)
  hash.gsub(/(\n)\s*(:\w+)\s*=>\s*/, '\1  \2: ')
end


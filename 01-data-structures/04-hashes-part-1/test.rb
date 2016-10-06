def index(key, size)
    len = key.length 
    asc = 0
    key.each_byte do |c|
      asc += c
    end

    return asc % size

end

puts index("The Lord of the Rings: The Fellowship of the Ring", 6)
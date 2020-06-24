def shout_out_to(name)
  loud_name = name.chars.map { |c| c.upcase! }.join("")

  puts 'HEY ' + loud_name
end

shout_out_to('you')
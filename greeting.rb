def greeting
greeting = ARGV.shift
ARGV.each do |name|
    puts "#{greeting} #{name}!"
  end
end

greeting

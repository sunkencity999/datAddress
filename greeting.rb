
def greeting
  greeting = ARGV.shift
  ARGV.each do |arg|
  puts " #{greeting} #{arg}! Thank you for using datAddress. We aim to be a unique and simple solution for personally cultivating contacts. The people you add to datAddress are the people who *matter*.--Christopher "
  end
end

greeting

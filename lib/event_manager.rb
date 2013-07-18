require "csv"
puts "EventManager initialized"

if File.exists? "event_attendees.csv"
  contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
  contents.each do |row|
    name = row[:first_name]
    zip = row[:zipcode]
    puts "#{name} #{zip}"
  end
end


require "csv"
puts "EventManager initialized"

if File.exists? "event_attendees.csv"
  contents = CSV.open "event_attendees.csv", headers: true
  contents.each do |row|
    name = row[2]
    puts name
  end
end


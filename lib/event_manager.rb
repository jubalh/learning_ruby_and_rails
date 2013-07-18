puts "EventManager initialized"

if File.exists? "event_attendees.csv"
  lines = File.readlines "event_attendees.csv"
  lines.each do |line|
    puts line
  end
end


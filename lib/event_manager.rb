require "csv"
puts "EventManager initialized"

def clean_zipcode(zip)
  zip.to_s.rjust(5,"0")[0..4]
end

if File.exists? "event_attendees.csv"
  contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
  contents.each do |row|
    name = row[:first_name]
    zip = clean_zipcode(row[:zipcode])
    puts "#{name} #{zip}"
  end
end


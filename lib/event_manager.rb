require "csv"
puts "EventManager initialized"

def clean_zipcode(zip)
  if zip.nil?
    "0000"
  else
    length = zip.length
    if length < 5
      (5 - length).times do
        zip = 0.to_s + zip
      end
      zip
    elsif length > 5
      zip[0..4]
    else
      zip
    end
  end
end

if File.exists? "event_attendees.csv"
  contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
  contents.each do |row|
    name = row[:first_name]
    zip = clean_zipcode(row[:zipcode])
    puts "#{name} #{zip}"
  end
end


require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zip)
  zip.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
    legislators = Sunlight::Congress::Legislator.by_zipcode(zip)

    legislator_names = legislators.collect do |legislator|
      "#{legislator.first_name} #{legislator.last_name}"
    end
end

puts "EventManager initialized"

if File.exists? "form_letter.html"
  template_letter = File.read "form_letter.html"

  if File.exists? "event_attendees.csv"
   contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
   contents.each do |row|
     name = row[:first_name]
     zip = clean_zipcode(row[:zipcode])

     legislators = legislators_by_zipcode(zip).join(", ")

     personal_letter = template_letter.gsub('FIRST_NAME', name)
     personal_letter.gsub!('LEGISLATORS', legislators)

     puts personal_letter
   end
  end
end


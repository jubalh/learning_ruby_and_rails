require "csv"
require "sunlight/congress"
require "erb"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zip)
  zip.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
    Sunlight::Congress::Legislator.by_zipcode(zip)
end

puts "EventManager initialized"

if File.exists? "form_letter.erb"
  if File.exists? "event_attendees.csv"
   contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

  template_letter = File.read "form_letter.erb"
  erb_template = ERB.new template_letter

   contents.each do |row|
     name = row[:first_name]
     zip = clean_zipcode(row[:zipcode])

     legislators = legislators_by_zipcode(zip)

     form_letter = erb_template.result(binding)

     puts form_letter
   end
  end
end


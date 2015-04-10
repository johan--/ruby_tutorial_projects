require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone(homephone)
  phone_number = homephone.to_s.gsub(/[\.\-()\s]/,"")

  if phone_number.length == 10
    phone_number
  elsif phone_number.length == 11 && phone_number.split(//)[0] == "1"
    phone_number[1..10]
  else
    ""
  end
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone = clean_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end

=begin
Iteration: Time Targeting

The boss is already thinking about the next conference: "Next year I want to make better use of our Google and Facebook advertising. Find out which hours of the day the most people registered so we can run more ads during those hours." Interesting!

Using the registration date and time we want to find out what are the peak registration hours.

Ruby has a Date library which contains classes for Date and DateTime.

DateTime#strptime is a method that allows us to parse date-time strings and convert them into Ruby objects.

DateTime#strftime is a good reference on the characters necessary to match the specified date-time format.

Use Date#hour to find out the hour of the day.



Iteration: Day of the Week Targeting

The big boss gets excited about the results from your hourly tabulations. It looks like there are some hours that are clearly more important than others. But now, tantalized, she wants to know "What days of the week did most people register?"

Use Date#wday to find out the day of the week.
=end

# http://tutorials.jumpstartlab.com/projects/eventmanager.html

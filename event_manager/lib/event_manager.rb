require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
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
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end

=begin
Iteration: Clean Phone Numbers

Similar to the zip codes the phone numbers suffer from multiple formats and inconsistencies. If we wanted to allow individuals to sign up for mobile alerts with the phone numbers we would need to make sure all of the numbers are valid and well-formed.

If the phone number is less than 10 digits assume that it is a bad number
If the phone number is 10 digits assume that it is good
If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
If the phone number is 11 digits and the first number is not 1, then it is a bad number
If the phone number is more than 11 digits assume that it is a bad number



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

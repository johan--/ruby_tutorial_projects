require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

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

def clean_datetime(regdate)
  DateTime.strptime(regdate, '%m/%d/%y %H:%M')
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

hour_of_registration = []
day_of_registration = []

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone = clean_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  datetime = clean_datetime(row[:RegDate])

  hour_of_registration << datetime.hour
  day_of_registration << datetime.wday

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end

frequency_hash_of_hour = hour_of_registration.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
most_common_hour = hour_of_registration.max_by { |v| frequency_hash_of_hour[v] }

days = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday ]
days_hashmap = Hash[(0..6).zip(days)]

frequency_hash_of_day = day_of_registration.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
most_common_day_number = day_of_registration.max_by { |v| frequency_hash_of_day[v] }
most_common_day = days_hashmap[most_common_day_number.to_i]

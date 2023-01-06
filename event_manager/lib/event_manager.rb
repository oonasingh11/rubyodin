require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

def open_csv
contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
end


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

puts 'Event Manager Initialized!'

lines = File.readlines('event_attendees.csv')
lines.each_with_index do |line, index|
  next if index.zero?

  columns = line.split(",")
  name = columns[2]
  puts name
end


contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])


  puts "#{name} #{zipcode}"
end

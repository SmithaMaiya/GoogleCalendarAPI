#require 'google/apis/calendar_v3'
require 'googleauth'

require 'googleauth'
require 'google/apis'
#require 'googleauth'
require 'fileutils'
require 'require_all'
#require_all 'support/*/*.rb'
require 'google/apis/core/batch'

require 'google/apis/calendar_v3/service.rb'
require 'google/apis/calendar_v3/classes.rb'
require 'google/apis/calendar_v3/representations.rb'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# Get the environment configured authorization
ENV['GOOGLE_APPLICATION_CREDENTIALS']="C://Users//mayya//Desktop//secret.json"

scopes =  ['https://www.googleapis.com/auth/compute']
authorization = Google::Auth.get_application_default(scopes)

# Clone and set the subject
auth_client = authorization.dup
auth_client.sub = 'smitharmaiya@gmail.com'
auth_client.fetch_access_token!

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.authorization = auth_client

# Fetch the next 10 events for the user
calendar_id = 'primary'
response = service.list_events(calendar_id,
                               max_results: 10,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)
puts 'Upcoming events:'
puts 'No upcoming events found' if response.items.empty?
response.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end
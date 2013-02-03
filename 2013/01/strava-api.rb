email=ARGV[0]
password=ARGV[1]

require 'strava-api'

a = StravaApi::Base.new
p a.clubs('hashmoo')

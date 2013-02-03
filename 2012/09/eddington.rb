require 'rubygems'
require 'open-uri'
require 'time'
require 'guppy'

distances = Hash.new(0)
seen = {}

$stdin.readlines.each do |arg|
    begin
        tcx = Guppy::Db.open(arg.chomp)

        tcx.activities.each do |ac|
            t_type = ac.sport
            t_id = ac.date

            if t_id.nil? then
                raise "#{arg} (#{t_type}) has no id?"
            end
            
            # assuming this is constant
            if t_type != 'Biking' then
                puts "- #{t_id} #{t_type} #{arg.chomp}"
                next
            end
            if not seen[t_id].nil? then
                puts "D #{t_id} #{arg.chomp}"
                next
            end

            # remember that we've seen this activity, avoid duplicates
            seen[t_id] = 'seen'

            date = t_id.strftime('%Y-%m-%d')

            points = 0
            f_dist = 0
            ac.laps.each do |lap|
                f_dist = f_dist + lap.distance
                points = points + lap.track_points.size
            end

            # ignore stationary rides
            if points == 0 then
                puts "T #{t_id} #{arg.chomp}"
                next
            end

            distances[date] = distances[date] + f_dist

            puts "+ #{t_id} #{f_dist} #{distances[date]} #{arg.chomp}"
        end
    rescue
    end
end

distances.keys.each do |k|
    distances[k] = (distances[k] / 1609).to_i
end
mpd = distances.sort_by{|k,v| v}.reverse
p mpd

eddington = 0
longrides = []
mpd.each_with_index do |b,i|
    d, m = b
    if m >= (i+1) then
        eddington = i+1
        longrides << d
        puts "#{d} #{m} pushes eddington to #{i+1}"
    end
end
p eddington
p longrides


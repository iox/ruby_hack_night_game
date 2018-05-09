#!/usr/bin/env ruby

team_numbers = ARGV[0]
challenge = ARGV[1]

if team_numbers.nil? || challenge.nil?
  puts "USAGE: ./start.rb 1,2,3 demo_challenge"
  exit
end

for number in team_numbers.split(",")
  path = "team#{number}"
  
  # Clean ENV
  `mkdir -p #{path}`
  backup_path = "backups/#{path}/before_#{challenge}"
  `mkdir -p #{backup_path}`
  `rm -rf #{backup_path}/*`
  `mv #{path}/* #{backup_path}`
  `rm #{path}/.c9 -Rf`

  # Prepare TMP folder
  `mkdir -p #{path}/tmp`
  `touch #{path}/tmp/start_time.txt`

  # Copy the fresh challenge
  `cp -pr challenges/#{challenge} #{path}/`
  `cp #{path}/#{challenge}/tmp/total_examples.txt #{path}/tmp`  

  # Restart docker instance
  `docker run -it -d -p 1000#{number}:80 -p 1030#{number}:3000 -v /root/cphrb/team#{number}/:/workspace/ --name cphrb_team#{number} cphrb:latest`
  `docker restart cphrb_team#{number}`
end


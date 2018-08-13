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

  # Prepare the run.sh script
  `echo "cd /workspace/#{challenge} && bundle exec rspec --format progress --format json --out ../tmp/test_results.txt && bundle exec rubocop --format simple --format quiet -o ../tmp/rubocop_results.txt" > #{path}/run.sh`

  # Prepare the cloud9 settings
  `mkdir #{path}/.c9/`
  `cp project.settings #{path}/.c9/`
  `cp state.settings #{path}/.c9/`

  # Restart docker instance
  `docker run -it -d -p 1000#{number}:80 -p 1030#{number}:3000 -v /root/cphrb/team#{number}/:/workspace/ --name cphrb_team#{number} cphrb:latest`
  `docker restart cphrb_team#{number}`
end


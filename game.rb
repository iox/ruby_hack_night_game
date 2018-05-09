require 'json'

class Team
  def initialize(number:)
    @number = number
    begin
      @rspec_total = File.read("#{path}/tmp/total_examples.txt").to_i
    rescue
      @rspec_total = 1000
    end
  end

  attr_reader(:number)
  
  def rubocop_result
    if rubocop_number_of_alerts == -1
      "NOT RUN YET: #{rubocop_points} points"
    else
      "#{rubocop_number_of_alerts} offenses: #{rubocop_points} points"
    end
  end
  
  def rubocop_color
    if rubocop_number_of_alerts == -1
      :cyan
    elsif rubocop_number_of_alerts == 0
      :green
    else
      :yellow
    end
  end
  
  def rubocop_points
    if rubocop_number_of_alerts == -1
      0
    else
      10 - rubocop_number_of_alerts
    end
  end
  
  def rubocop_number_of_alerts
    if rspec_percentage == 100 && File.exists?("#{path}/tmp/rubocop_results.txt")
      `cat #{path}/tmp/rubocop_results.txt | grep offense`.split(" ")[3].to_i
    else
      -1
    end
  end
  
  
  def time_seconds
    begin
      start_time = File.new("#{path}/tmp/start_time.txt").ctime.to_i
      end_time = File.new("#{path}/tmp/test_results.txt").ctime.to_i
      
      end_time - start_time
    rescue
      -1
    end
  end
  
  def time_points
    return 0 if time_seconds.nil?
    return 0 if rspec_passed < 1
    
    passed_minutes = time_seconds / 60
    if passed_minutes < 10
      return 10
    elsif passed_minutes > 20
      return 0
    else
      return 20 - passed_minutes
    end
  end
  
  def time_result
    Time.at(time_seconds).utc.strftime("%M:%S")+ "  #{time_points} points"
  end
  
  def rspec_json
    begin
      JSON.parse(File.read("#{path}/tmp/test_results.txt"))
    rescue
      {"error": true, "summary" => {"example_count" => 0, "failure_count" => 0, "pending_count" => 0} }
    end
  end
  
  def rspec_summary
    rspec_json["summary"]
  end
  
  def rspec_passed
    rspec_summary["example_count"] - rspec_summary["failure_count"] - rspec_summary["pending_count"]
  end
  
  def rspec_total
    @rspec_total
  end
  
  def rspec_percentage
    rspec_passed * 100 / rspec_total
  end
  
  def rspec_points
    20*rspec_percentage/100
  end
  
  def rspec_result
    if File.exists?("#{path}/tmp/test_results.txt")
      "#{rspec_passed}/#{rspec_total} (#{rspec_percentage}%): #{rspec_points} points"
    else
      "NOT RUN YET: #{rspec_points} points"
    end
  end
  
  def rspec_color
    if !File.exists?("#{path}/tmp/test_results.txt")
      :cyan
    elsif rspec_percentage == 100
      :green
    else
      :yellow
    end
  end
  
  def path
    "team#{number}"
  end
  
  def total_points
    "  #{(rspec_points + rubocop_points + time_points).to_s.rjust(2, '0')} points  "
  end
    
end


class Game
  def initialize(teams:)
    @teams = []
    for number in teams
      @teams << Team.new(number: number)
    end
  end
  
  def teams
    @teams
  end
end

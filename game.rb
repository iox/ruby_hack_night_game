require 'json'

class Team
  def initialize(number:)
    @number = number
    begin
      @total_number_of_tests = File.read("#{path}/tmp/total_examples.txt").to_i
    rescue
      @total_number_of_tests = 1000
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
    if tests_percentage > 99 && File.exists?("#{path}/tmp/rubocop_results.txt")
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
    return 0 if number_of_passed_tests < 1
    
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
  
  def number_of_passed_tests
    # Minitest outputs plain text
    if File.exists?("#{path}/tmp/test_results.txt") && File.readlines("#{path}/tmp/test_results.txt").grep(/assertions/).any?
      splitted = `cat #{path}/tmp/test_results.txt | grep assertions,`.split(" ")
      splitted[2].to_i - splitted[4].to_i - splitted[6].to_i
    # Rspec outputs a JSON file
    else
      rspec_summary["example_count"] - rspec_summary["failure_count"] - rspec_summary["pending_count"]
    end
  end
  
  def total_number_of_tests
    @total_number_of_tests
  end
  
  def tests_percentage
    number_of_passed_tests * 100 / total_number_of_tests
  end
  
  def tests_points
    20*tests_percentage/100
  end

  def tests_result
    if File.exists?("#{path}/tmp/test_results.txt")
      "#{number_of_passed_tests}/#{total_number_of_tests} (#{tests_percentage}%): #{tests_points} points"
    else
      "NOT RUN YET: #{tests_points} points"
    end
  end
  
  def tests_color
    if !File.exists?("#{path}/tmp/test_results.txt")
      :cyan
    elsif tests_percentage > 99
      :green
    else
      :yellow
    end
  end
  
  def path
    "team#{number}"
  end
  
  def total_points
    "  #{(tests_points + rubocop_points + time_points).to_s.rjust(2, '0')} points  "
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

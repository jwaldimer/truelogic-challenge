class Challenge
  # In the attached file (w_data.dat), you’ll find daily weather data.
  # Download this text file, then write a program to output the day number (column one)
  # with the smallest temperature spread (the maximum temperature is the second column,
  # the minimum the third column).
  def self.smallest_temperature_spread
    lines = read_and_clean_file('w_data.dat')
    spreads = []

    lines.each do |data|
      line = data.split(' ')
      next unless line[0].to_i.positive?

      spreads << [line[0], (line[1].to_f - line[2].to_f)]
    end
    smallest_temperature = spreads.min_by(&:last)
    
    smallest_temperature.first.to_i
  end

  # The attached soccer.dat file contains the results from the English Premier League.
  # The columns labeled ‘F’ and ‘A’ contain the total number of goals scored for and
  # against each team in that season (so Arsenal scored 79 goals against opponents,
  # and had 36 goals scored against them). Write a program to print the name of the team
  # with the smallest difference in ‘for’ and ‘against’ goals.
  def self.smallest_goals_difference
    lines = read_and_clean_file('soccer.dat')
    differences = []

    lines.each do |data|
      line = data.split(' ')
      next unless line[0].to_i.positive?

      differences << [line[1], (line[6].to_i - line[8].to_i).abs]
    end
    smallest_goals = differences.min_by(&:last)

    smallest_goals.first
  end

  private
  
  def read_and_clean_file(filename)
    file = File.open(filename, File::RDONLY)
    lines = file.readlines.map!(&:chomp)
    lines.reject!(&:empty?).map!(&:strip)

    lines
  end
end

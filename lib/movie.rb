class Movie < Product
  attr_reader :year, :director

  def self.from_file(file_path)
    file_data = File.readlines(file_path, chomp: true)
    new(
      name: file_data[0],
      director: file_data[1],
      year: file_data[2],
      price: file_data[3],
      amount: file_data[4])
  end

  def initialize(params)
    super

    @year = params[:year].to_i
    @director = params[:director]
  end

  def update(params)
    super

    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def to_s_clean
    "Фильм #{@name}, #{@year}, реж. #{@director}"
  end

  def to_s
    "#{to_s_clean}#{super}"
  end
end

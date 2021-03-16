class Album < Product
  attr_reader :performer, :genre, :year

  def self.from_file(file_path)
    file_data = File.readlines(file_path, chomp: true)
    self.new(name: file_data[0],
             performer: file_data[1],
             genre: file_data[2],
             year: file_data[3],
             price: file_data[4],
             amount: file_data[5])
  end

  def initialize(params)
    super

    @performer = params[:performer]
    @genre = params[:genre]
    @year = params[:year].to_i
  end

  def update(params)
    super

    @performer = params[:performer] if params[:performer]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def to_s_clean
    "Альбом #{@performer} — «#{@name}», #{@genre}, #{@year}"
  end

  def to_s
    self.to_s_clean + super
  end
end

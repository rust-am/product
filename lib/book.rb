class Book < Product
  attr_reader :genre, :author

  def self.from_file(file_path)
    file_data = File.readlines(file_path, chomp: true)
    new(
      name: file_data[0],
      genre: file_data[1],
      author: file_data[2],
      price: file_data[3],
      amount: file_data[4])
  end

  def initialize(params)
    super

    @genre = params[:genre]
    @author = params[:author]
  end

  def update(params)
    super

    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  def to_s_clean
    "Книга «#{@name}», #{@genre}, автор — #{@author}"
  end

  def to_s
    "#{to_s_clean}#{super}"
  end
end

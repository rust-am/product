class Product
  attr_accessor :price, :amount, :name

  # def self.product_types
  #   [Book, Movie]
  # end
  #
  # def self.create(type_index)
  #   product_types[type_index].new
  # end

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def initialize(params)
    @name = params[:name]
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end

  def update(params)
    @name = params[:name] if params[:name]
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end
end

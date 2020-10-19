class Product
  attr_reader :price, :quantity_in_stock

  def initialize
    @price = nil
    @quantity_in_stock = nil
  end
end
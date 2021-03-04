class Basket
  def initialize(products = [])
    @products = products
  end

  def add(product)
    @products << product
  end

  def to_s
    @products.join("\n")
  end

  def sum
    @products.sum(&:price)
  end
end

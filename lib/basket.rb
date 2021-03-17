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

  def checkout
    @products.tally.map do |product, count|
      "#{product.to_s_clean} | #{count}шт. на сумму #{product.price * count}"
    end.join("\n")
  end
end

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
    uniq_prod = @products.uniq
    output = []

    uniq_prod.each do |p|
      count = @products.count(p)
      output << "#{p.to_s_clean} | #{count}шт. на сумму #{p.price * count}"
    end

    output.join("\n")
  end
end

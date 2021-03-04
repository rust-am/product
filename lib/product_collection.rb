require 'active_support/core_ext/string/inflections'

class ProductCollection

  def self.from_dir(dir_path)
    products = []
    
    directories = Dir.entries(dir_path).select { |entry| File.directory? File.join(dir_path, entry) and !(entry =='.' || entry == '..') }

    directories.each do |dir|
      Dir["#{dir_path}/#{dir}/*.txt"].each do |path|
        products << dir.classify.constantize.from_file(path)
      end
    end

    self.new(products)
  end

  def initialize(products = [])
    @products = products
  end

  def to_a
    @products
  end

  def size
    @products.size
  end

  def delete_out_product!
    @products.select! { |product| product.amount > 0 }
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :amount
      @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc

    self 
  end
end

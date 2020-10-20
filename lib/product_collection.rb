require 'active_support/core_ext/string/inflections'

class ProductCollection

  # PRODUCT_TYPES = {film: {dir: 'films', class: Film}, book: {dir: 'books', class: Book}}

  def self.from_dir(dir_path)
    products = []
    # приерно понимаю что тут происходит, но блок разбить не могу
    directories = Dir.entries(dir_path).select { |entry| File.directory? File.join(dir_path, entry) and !(entry =='.' || entry == '..') }

    directories.each do |dir|
      Dir["#{dir_path}/#{dir}/*.txt"].each do |path|
        products << dir.classify.constantize.from_file(path)
      end
    end
    self.new(products) #???
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

  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by! { |product| product.to_s }
    when :price
      # Если запросили сортировку по цене
      @products.sort_by! { |product| product.price }
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by! { |product| product.amount }
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
    self #???
  end
end

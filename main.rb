require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/album'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir("#{__dir__}/data") #в метод кдасса уходит ./data только полный

collection.sort!(by: :price, order: :asc)

choice = -1
basket_price = 0
basket =[]

until choice == 0 && choice < collection.size
  puts "Что хотите купить?"
  puts

  collection.to_a.each.with_index(1) do |product, index|
    puts "#{index}. #{product}"
  end
  puts "0.Выход"
  puts

  choice = gets.to_i
  puts
  # отсекаем выход
  unless choice == 0
    # индекс начали с 1 поэтому надо откатить индекс(choice) на 1
    unless collection.to_a[choice - 1].amount == 0
      collection.to_a[choice - 1].amount -= 1
      basket_price += collection.to_a[choice - 1].price
      basket << collection.to_a[choice - 1]

      puts "Вы выбрали: #{collection.to_a[choice - 1]}"
    else
      puts "Товар закончился:("
    end

    puts
    puts "Всего товаров на сумму: #{basket_price} руб."
    puts "================================================================================"
    puts
  end
end

puts "Вы купили:"
basket.each { |product| puts product}
puts
puts "С Вас — #{basket_price} руб. Спасибо за покупки!"
puts



# puts "chose product type:"
#
# choices = Product.product_types
# choice = -1
#
# until choice >= 0 && choice < choice.size
#   choices.each_with_index do |type, index|
#     puts "#{index}. #{type}"
#   end
#
#   choice = gets.to_i
# end


# p movie = Movie.from_file('./data/movies/01.txt')
# p book = Book.from_file('./data/books/01.txt')
# p product = Product.from_file('./data/books/01.txt')

# movie1 = Movie.new(name: "Леон", year: 1994, director: "Люк Бессон", price: 990, amount: 13)
# puts movie1

# leon = Movie.new(name: 'Леон', director: 'Люк Бессон', price: 990)
# leon.update(year: 1994, amount: 5)
# puts leon
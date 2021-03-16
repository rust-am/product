require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/album'
require_relative 'lib/product_collection'
require_relative 'lib/basket'

collection = ProductCollection.from_dir("#{__dir__}/data")
collection.sort!(by: :price, order: :asc)

puts "Добро пожаловать в консольный магазин"
puts "======================================================================\n\n"

basket = Basket.new
choice = 1

until choice == 0 
  collection.to_a.each.with_index(1) do |product, index|
    puts "#{index}. #{product}"
  end

  puts "0.Выход"
  puts "======================================================================\n\n"

  puts "Для выбора товара введите его порядковый номер или 0 для выхода"
  choice = STDIN.gets.to_i

  if (1..collection.size).include?(choice)
    user_choice = collection.to_a[choice - 1]
    user_choice.amount -= 1
    basket.add(user_choice)
    collection.delete_out_product!

    puts "\nВы выбрали: #{user_choice}"
    puts "======================================================================\n\n"
    puts "Ваша корзина:"
    puts basket.checkout
    puts "\nВсего товаров на сумму: #{basket.sum} руб."
    puts "======================================================================\n\n"
  end
end

puts "Вы купили:"
puts basket.checkout
puts "\nС Вас — #{basket.sum} руб. Спасибо за покупки!\n\n"

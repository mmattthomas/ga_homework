puts "Welcome to Hungry App\n"

appetizers = ['Nachos', 'Mozzerella Sticks', 'Chips and Salsa', 'French Fries']
entrees = ['Hamburger', 'Chicken Strips', 'Fried Chicken']
desserts = ['Chocolate Cake', 'Apple Pie']
drinks = ['Coca Cola', 'Root Beer', 'Seven Up']


user_order = Array.new


# Appetizer
puts "App Menu:"
puts "---------"
puts "0: No Appetizer"
appetizers.each_with_index do |app, index|
    puts "#{index+1}: #{app}"
end
print 'What # appetizer would you like ?: '
choice = gets.chomp
if choice.downcase != '' && choice.to_i != 0
  index = choice.to_i-1
  user_order << appetizers[index]
end

# Entre
puts "\nEntre Menu:"
puts "-----------"
puts "0: No Entre"
entrees.each_with_index do |entree, index|
    puts "#{index+1}: #{entree}"
end

print 'What # Entre would you like ?: '
choice = gets.chomp
if choice.downcase != '' && choice.to_i != 0
  index = choice.to_i-1
  user_order << entrees[index]
end

# Dessert
puts "\nDessert Menu:"
puts "-------------"
puts "0: No Dessert"
desserts.each_with_index do |dessert, index|
    puts "#{index+1}: #{dessert}"
end

print 'What # Dessert would you like ?: '
choice = gets.chomp
if choice.downcase != '' && choice.to_i != 0
  index = choice.to_i-1
  user_order << desserts[index]
end

# Drink
puts "\nDrink Menu:"
puts "-------------"
puts "0: No Drink"
drinks.each_with_index do |drink, index|
    puts "#{index+1}: #{drink}"
end

print 'What # Drink would you like ?: '
choice = gets.chomp
if choice.downcase != '' && choice.to_i != 0
  index = choice.to_i-1
  user_order << drinks[index]
end


puts "\n\n\nOkay, uh, I have your order as :"

user_order.each do |user_order_item|
    puts user_order_item
end
puts ""
puts "Is that correct?"
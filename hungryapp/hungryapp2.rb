require 'twilio-ruby'
require 'json'

def load_menu
  aFile = File.open('menu.json', 'r') do |f|
    JSON.load f
  end
end

def load_default_menu

  the_menu = {'appetizer' => ['Nachos', 'Mozzerella Sticks', 'Chips and Salsa', 'French Fries'],
              'entree'    => ['Hamburger', 'Chicken Strips', 'Fried Chicken'], 
              'dessert'   => ['Chocolate Cake', 'Apple Pie'],
              'drink'     => ['Coca Cola', 'Root Beer', 'Seven Up']
         }
end

def send_sms message
  # put your own credentials here
  account_sid = 'ACa76cef3f3fabc5e85a8cb02244e34755'
  auth_token  = '3434b116d6d37536596d8553067de4fc'

  # set up a client to talk to the Twilio REST API
  client = Twilio::REST::Client.new account_sid, auth_token

  # send sms
  client.account.messages.create(
    :from => '+13236294399',
    :to => '+13239634649',
    :body => message
  )
end

def print_menu_section (menu, menu_section_name)
  puts ""
  puts "#{menu_section_name} Menu:"
  puts "---------"
  puts "0: No #{menu_section_name}"
  menu.each_with_index do |menu_item, index|
      puts "#{index+1}: #{menu_item}"
  end
end

def get_menu_section_order_count (menu_section_name)
  print "\nHow many #{menu_section_name}s will you order?: "
  gets.chomp.to_i
end

def get_menu_section(menu, menu_section_name, order_number)
  print "(#{order_number}) What \# #{menu_section_name} would you like ?: "
  choice = gets.chomp
  if choice.downcase != '' && choice.to_i != 0
    index = choice.to_i-1
    menu[index]
  else
    nil
  end
end

def get_notes()
  puts ""
  puts "Please add additional notes for this order."
  puts "(otherwise just press <<enter>>)"
  gets.chomp
end

puts 'Welcome to the Hungry App'
puts '-------------------------'

#get menu from json file:
hungry_menu = load_menu

## Special code to write out menu to JSON file:
#puts 'temp: printing menu json' 
# aFile = File.open('menu.json', 'w+') do |f|
#   f.write JSON.pretty_generate(hungry_menu)
# end
# puts 'temp: done writing menu'

hungry_order = Array.new

#for each menu subsection...
hungry_menu.each do |k, v|
  print_menu_section v, k
  count = get_menu_section_order_count k
  for i in 1..count
    hungry_choice = get_menu_section v, k, i
    hungry_order << hungry_choice unless hungry_choice.nil?
  end
end
special_order = get_notes
hungry_order << "Special Notes: #{special_order}" unless special_order.empty?

puts "\n\n\nOkay, uh, I have your order as :"

sms_order = ""
hungry_order.each do |user_order_item|
    puts user_order_item
    sms_order = sms_order + user_order_item + "\n"
end
puts ""
puts "Is that correct?"
puts "Just kidding, of course it is."

# SMS
if hungry_order.length > 0
  puts "Sending order to kitchen cell phone."
  send_sms sms_order
  puts "Sent!"
else
  puts "You ordered nothing!"
end


# frozen_string_literal: true

VERSION = "0.1.0"

require_relative './entities/door'
require_relative './entities/host'
require_relative './entities/player'
require_relative './helpers'

doors = generate_doors(3, 1)

player = Player.new(doors)
host = Host.new(doors)
player.add_new_observer(host)

puts "Enter the number of door"
user_choice = gets.chomp.downcase
player.choose_door(Integer(user_choice))

puts "Would you like to switch doors? (yes/no)"
user_choice = gets.chomp.downcase
if user_choice == 'yes'
  player.switch_choice(host.opened_door)
end

# Проверяем результат
if player.selected_door.has_car?
  puts "Congratulations! You won a Car behind Door #{player.selected_door.id}!"
else
  puts "Sorry, it's a Goat behind Door #{player.selected_door.id}. Better luck next time!"
end





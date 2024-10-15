# frozen_string_literal: true

VERSION = "0.1.0"

require_relative './entities/door'
require_relative './entities/host'
require_relative './entities/player'



doors = (1..3).map { |i| Door.new(i) }

print doors

player = Player.new(doors)
host = Host.new(doors)

# Логика игры
player.add_new_observer(host)
player.choose_door(1)
player.choose_door(2)





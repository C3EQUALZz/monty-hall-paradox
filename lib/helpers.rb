# frozen_string_literal: true
def generate_doors(total_doors, car_count)
  prizes = Array.new(car_count) { Car.new } + Array.new(total_doors - car_count) { Goat.new }
  prizes.shuffle.map.with_index(1) { |prize, id| Door.new(id, prize) }
end

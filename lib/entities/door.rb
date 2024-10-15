# frozen_string_literal: true
require_relative './prizes/car'
require_relative './prizes/goat'

class Door
  attr_reader :id, :is_opened

  def initialize(id)
    @id = id
    @is_opened = false
    @prize = rand(1..3) == 1 ? Car.new : Goat.new
  end

  def has_car?
    @prize.is_a?(Car)
  end

  def open
    @is_opened = true
    puts "Door #{@id} is opened! It's a #{@prize.name}!"
  end
end
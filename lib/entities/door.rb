# frozen_string_literal: true
require_relative './prizes/car'
require_relative './prizes/goat'

class Door
  attr_reader :id, :is_opened

  def initialize(id, prize)
    @id = id
    @is_opened = false
    @prize = prize
  end

  def has_car?
    @prize.is_a?(Car)
  end

  def open
    @is_opened = true
    puts "Door #{@id} is opened! It's a #{@prize.name}!"
  end

  def close
    @is_opened = false
  end

  def to_s
    prize_type = has_car? ? "Car" : "Goat"
    status = @is_opened ? "opened" : "closed"
    "Door #{@id} (#{status}, contains: #{prize_type})"
  end

end
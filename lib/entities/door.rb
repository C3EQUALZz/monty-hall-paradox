# frozen_string_literal: true

class Door
  attr_reader :prize, :is_open

  def initialize(prize)
    @prize = prize
    @is_open = false
  end

  def open
    @is_open = true
  end

  def has_prize?
    prize.is_a?(Car)
  end
end

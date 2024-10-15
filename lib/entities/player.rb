# frozen_string_literal: true

require_relative '../core/interfaces/observable'

class Player
  include Observable

  attr_accessor :selected_door, :doors

  def initialize(doors)
    @observers = []
    @doors = doors
    @selected_door = nil
  end

  def choose_door(index)
    if index.between?(0, @doors.size - 1)
      @selected_door = @doors[index]
      notify_all_observers
    else
      raise ArgumentError, "Invalid door index"
    end
  end

  def switch_choice(host_opened_door)
    @selected_door = (@doors - [@selected_door, host_opened_door]).first
  end
end


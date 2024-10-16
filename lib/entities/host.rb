# frozen_string_literal: true

require_relative '../core/interfaces/observer'

class Host
  include Observer

  attr_reader :opened_door

  def initialize(doors)
    @doors = doors
    @opened_door
  end

  def update(player)
    remaining_doors = @doors.reject { |door| door == player.selected_door || door.has_car? }

    @opened_door = remaining_doors.sample

    if @opened_door.nil?
      raise ArgumentError, "All doors have cars as a prize"
    end

    @opened_door.open if @opened_door
  end
end
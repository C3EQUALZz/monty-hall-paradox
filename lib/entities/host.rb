# frozen_string_literal: true

require_relative '../core/interfaces/observer'

class Host
  include Observer

  def initialize(doors)
    @doors = doors
  end

  def update(player)
    # Здесь хост выбирает дверь с козой, которую не выбрал игрок
    host_opened_door = @doors.reject { |door| door == player.selected_door || door.has_car? }.sample
    host_opened_door.open
  end
end
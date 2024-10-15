# frozen_string_literal: true

class Player
  attr_accessor :selected_door

  def choose_door(doors)
    @selected_door = doors.sample
  end

  def switch_choice(doors, host_opened_door)
    @selected_door = (doors - [@selected_door, host_opened_door]).first
  end
end

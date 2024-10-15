# frozen_string_literal: true
module Observable
  def initialize
    @observers = []
  end

  def add_new_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_all_observers
    @observers.each { |observer| observer.update(self) }
  end
end


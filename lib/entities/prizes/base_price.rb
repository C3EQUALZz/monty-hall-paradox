# frozen_string_literal: true

class BasePrize
  attr_reader :name
  def initialize
    raise NotImplementedError, 'This attribute should be implemented by subclasses'
  end
end

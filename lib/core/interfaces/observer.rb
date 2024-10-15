# frozen_string_literal: true
module Observer
  def update(player)
    raise NotImplementedError, 'Observer subclasses must implement update method'
  end
end


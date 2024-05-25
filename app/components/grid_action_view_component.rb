# frozen_string_literal: true

class GridActionViewComponent < ViewComponent::Base
  def initialize(url:)
    @url = url
  end
end

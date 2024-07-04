  # frozen_string_literal: true

class MenuItemMainComponent < ViewComponent::Base
  def initialize(url:, icon:, target:, has_items: , items:)
    @url = url
    @icon = icon
    @target_blank = target
    @has_items = has_items
    @items = items
  end
end

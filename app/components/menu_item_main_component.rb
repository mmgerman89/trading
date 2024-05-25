# frozen_string_literal: true

class MenuItemMainComponent < ViewComponent::Base
  def initialize(url:, icon:, has_items: , items:)
    @url = url
    @icon = icon
    @has_items = has_items
    @items = items
  end
end

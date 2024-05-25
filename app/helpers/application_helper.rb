module ApplicationHelper
  def set_page_title(title = nil)
    return unless title

    content_for :page_title, "#{title}"
    content_for :content_title, title
  end
end

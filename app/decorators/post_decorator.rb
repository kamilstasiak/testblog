class PostDecorator < Draper::Decorator
  decorates :post
  delegate_all

  def friendly_title
    object.title.downcase.gsub("\ ", "-")
  end

end

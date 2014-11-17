class DeedSerializer < ActiveModel::Serializer
  include ActionView::Helpers::AssetUrlHelper
  include Rails.application.routes.url_helpers

  extend Forwardable
  def_delegator :object, :happiness

  attributes :id, :person, :action, :happiness_icon_url, :timestamp, :likes_count, :reported, :liked, :like_url

  def happiness_icon_url
    image_path("/assets/icons/happiness/#{happiness}.png")
  end

  def timestamp
    object.created_at.to_i.in_milliseconds
  end

  def reported
    object.reports.any?
  end

  def liked
    likes_count > 0
  end

  def like_url
    deed_url(object)
  end
end

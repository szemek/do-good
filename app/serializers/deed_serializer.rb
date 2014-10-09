class DeedSerializer < ActiveModel::Serializer
  include ActionView::Helpers::AssetUrlHelper

  extend Forwardable
  def_delegator :object, :happiness

  attributes :id, :person, :action, :happiness_icon_url, :timestamp, :likes_count, :reported, :liked

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
    object.likes.where(ip: scope.ip).any?
  end
end

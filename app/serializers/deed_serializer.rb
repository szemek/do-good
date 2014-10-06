class DeedSerializer < ActiveModel::Serializer
  include ActionView::Helpers::AssetUrlHelper

  attributes :id, :person, :action, :happiness_icon_url, :timestamp, :likes_count

  def happiness_icon_url
    name = case object.happiness
      when 1 then 'ok'
      when 2 then 'smile'
      when 3 then 'happy'
      else 'ok'
    end

    image_path("/assets/icons/#{name}.png")
  end

  def timestamp
    object.created_at.to_i.in_milliseconds
  end
end

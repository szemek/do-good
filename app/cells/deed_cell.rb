class DeedCell < Cell::ViewModel
  include ActionView::Helpers::AssetTagHelper

  property :person
  property :action

  def show
    render
  end

  private

  def time
    model.created_at.strftime("%l:%M %P")
  end

  def happiness_icon
    name = case model.happiness
      when 1 then 'ok'
      when 2 then 'smile'
      when 3 then 'happy'
      else 'ok'
    end

    image_tag("/assets/icons/#{name}.png")
  end
end

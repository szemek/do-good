class DeedCell < Cell::ViewModel
  property :person
  property :action

  def show
    render
  end

  private

  def time
    model.created_at.strftime("%l:%M %P")
  end
end

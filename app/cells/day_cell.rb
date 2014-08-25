class DayCell < Cell::ViewModel
  def show
    render
  end

  private

  def number
    @number ||= scanned.first
  end

  def suffix
    @suffix ||= scanned.last

    content_tag(:sup, @suffix)
  end

  def scanned
    @scanned ||= model.day.ordinalize.scan(/\d+|\w+/)
  end

  def month
    model.strftime('%B')
  end
end

class CounterCell < Cell::ViewModel
  def show
    render
  end

  private

  def digits
    "#{model}".chars
  end
end

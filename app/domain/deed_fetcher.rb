class DeedFetcher
  def initialize(options = {})
    @page = options[:page]
    @created_at = options[:created_at]
  end

  def all
    Deed.all
        .includes(:reports)
        .where(Deed[:created_at].gteq(created_at))
        .order(created_at: :desc)
        .page(page)
  end

  private

  def page
    @page
  end

  def created_at
    Time.at(@created_at).to_datetime
  end
end

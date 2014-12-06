class DeedSearch < Searchlight::Search
  search_on Deed.all.includes(:reports).order(created_at: :desc)

  searches :page, :created_at

  def initialize(options = {})
    super
    self.created_at = Time.at(options[:created_at]).to_datetime
    self.page ||= 1
  end

  def search_created_at
    search.where(Deed[:created_at].gteq(created_at))
  end
end

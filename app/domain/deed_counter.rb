class DeedCounter
  def initialize(options = {})
    @created_at = options[:created_at]
  end

  def count
    Deed.where(Deed[:created_at].gteq(created_at))
        .count
  end

  private

  def created_at
    Time.at(@created_at).to_datetime
  end
end

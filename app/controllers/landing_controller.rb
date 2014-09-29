class LandingController < ApplicationController
  def show
    @deed = Deed.new
    @deeds = Deed.grouped_by_day
    @deeds_count = Deed.count
  end
end

class LandingController < ApplicationController
  def show
    @deed = Deed.new
    @deeds = Deed.all
    @deeds_count = Deed.count
  end
end

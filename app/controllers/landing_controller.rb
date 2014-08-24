class LandingController < ApplicationController
  def show
    @deed = Deed.new
    @deeds = Deed.all.order('created_at DESC').group_by{|deed| deed.created_at.beginning_of_day}
  end
end

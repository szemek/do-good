class LandingController < ApplicationController
  def show
    @deed = Deed.new
  end
end

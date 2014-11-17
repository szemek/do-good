class DeedsController < ApplicationController
  def show
    @deed = DeedSerializer.new(Deed.find(params[:id]))
  end
end

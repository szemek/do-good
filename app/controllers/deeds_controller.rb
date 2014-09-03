class DeedsController < ApplicationController
  def create
    deed = Deed.new(deed_params)
    deed.save

    redirect_to :back
  end

  private

  def deed_params
    params.require(:deed).permit(:person, :action, :happiness)
  end
end

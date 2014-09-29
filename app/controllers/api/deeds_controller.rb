class Api::DeedsController < ApplicationController
  def index
    deeds = Deed.all

    render json: deeds
  end

  def grouped
    deeds = Deed.grouped_by_day

    render json: deeds
  end

  def create
    deed = Deed.new(deed_params)
    deed.save

    render json: deed
  end

  private

  def deed_params
    params.require(:deed).permit(:person, :action, :happiness)
  end
end

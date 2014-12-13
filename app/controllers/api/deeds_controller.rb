class Api::DeedsController < ApplicationController
  def index
    deeds = DeedFetcher.new(search_params).all

    render json: deeds
  end

  def count
    render json: {count: Deed.count}
  end

  def create
    deed = Deed.new(deed_params)
    deed.save

    render json: deed
  end

  def show
    render json: Deed.find(params[:id])
  end

  def like
    deed = Deed.find(params[:id])
    deed.likes.find_or_create_by(ip: request.ip)
    deed.reload

    render json: deed
  end

  def unlike
    deed = Deed.find(params[:id])
    deed.likes.find_by(ip: request.ip).destroy
    deed.reload

    render json: deed
  end

  def report
    deed = Deed.find(params[:id])
    deed.reports.find_or_create_by(ip: request.ip)
    deed.reload

    render json: deed
  end

  private

  def search_params
    {
      page: params[:page],
      created_at: (params[:timestamp].to_i) / 1000
    }
  end

  def deed_params
    params.require(:deed).permit(:person, :action, :happiness)
  end
end

class Api::DeedsController < ApplicationController
  respond_to :json

  def index
    deeds = Deed.all

    respond_with(deeds)
  end
end

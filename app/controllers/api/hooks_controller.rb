class Api::HooksController < ApplicationController
  def email
    render json: InboundEmailCreator.create(request)
  end
end

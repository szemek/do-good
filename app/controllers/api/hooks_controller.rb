class Api::HooksController < ApplicationController
  def email
    render status: 200, nothing: true
  end
end

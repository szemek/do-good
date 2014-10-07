class FacebookController < ApplicationController
  def login
    redirect_to '/auth/facebook'
  end
end

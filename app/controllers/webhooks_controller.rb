class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new_response
    data = JSON.parse(request.body.read)
    p data
  end

  def redirect
    redirect_to root_path(token: params[:token])
  end
end

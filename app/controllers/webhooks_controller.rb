class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new_response
    data = JSON.parse(request.body.read)

    respondent_email = data["data"]["fields"].find { |i| i["label"] == "user_email" }["value"]

    Response.create!(
      respondent_email: respondent_email,
      response_id: data["data"]["responseId"],
      form_id: data["data"]["formId"],
      form_name: data["data"]["formName"],
      fields: data["data"]["fields"],
      user: User.find_by(email: respondent_email)
    )
  end

  def redirect
    redirect_to root_path(token: params[:token])
  end
end

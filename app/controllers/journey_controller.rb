class JourneyController < ApplicationController
  before_action :authenticate_user!

  def show
    @step3_response = current_user.responses.where("form_name LIKE ?", "%Step 3%").last
  end
end

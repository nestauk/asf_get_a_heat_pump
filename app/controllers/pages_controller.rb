class PagesController < ApplicationController
  def home
  end

  def step_1
    @response = current_user.responses.where("form_name LIKE ?", "%Step 3%").last
  end
end

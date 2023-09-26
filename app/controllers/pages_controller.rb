class PagesController < ApplicationController
  def home
  end

  def step3
    @response = current_user.responses.where("form_name LIKE ?", "%Step 3%").last if current_user
  end
end

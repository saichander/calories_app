class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && current_user.sign_in_count == 0
      redirect_to  new_user_body_metric_path
    end
  end
end

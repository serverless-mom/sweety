class StaticPagesController < ApplicationController
  def reports
    @user = current_user
  end
end

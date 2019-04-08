class DashboardController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path and return
    end
  end

  def update
    @user = current_user
    @user.assign_attributes(params.require(:user).permit(:memo))
   if @user.save
     flash[:notice] = "Updated"
    redirect_to dashboard_path
   end
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  
  def show
  end
  
  private
  
  def check_user #Prevent a user from directly accessing another user's profile.
    @user = User.find_by(id: params[:id])
    if @user.nil? or @user != current_user
      redirect_to current_user
    end
  end
end

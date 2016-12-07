class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :get_page
  before_action :ensure_one_rating_per_user, only: [:create]
  
  def create
    @rating = current_user.ratings.build(rating_params) 
    if @rating.save
      flash[:info] = "Your rating has been saved!"
      redirect_to @page
    else
      flash[:danger] = "Your rating was not saved."
      redirect_to @page
    end
  end
  
  private
  
  def get_page
     @page = Page.find(params[:page_id])
  end
  
  def rating_params
     params.permit(:score, :page_id)
  end
  
  def ensure_one_rating_per_user
    redirect_to root_url if current_user_has_rated?(current_user, @page)
  end
end

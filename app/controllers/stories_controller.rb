class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    
  def new
    @story = Story.new
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
  def create
    @story = Story.new(story_params)
    if @story.save
      current_user.link_story(@story)
      redirect_to new_page_path(:story => @story.id)
    else 
      render 'new'
    end
  end
  
  def index 
    @stories = Story.all
  end
  
  
  private
  
  def story_params
    params.require(:story).permit(:title)
  end
end

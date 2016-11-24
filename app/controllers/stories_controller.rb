class StoriesController < ApplicationController
  def new
    @story = Story.new
  end
  
  def show
    @story = Story.find_by(params[:id])
  end
  
  def create
    @story = Story.new(story_params)
    if @story.save
      current_story @story
      redirect_to new_page_path(title)
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

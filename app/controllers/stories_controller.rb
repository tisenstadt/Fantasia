class StoriesController < ApplicationController
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(story_params)
    if @story.save
      #Render a new page and redirect the user there.
    else render 'new'
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

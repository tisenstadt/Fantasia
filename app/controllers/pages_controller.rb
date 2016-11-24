class PagesController < ApplicationController
    

  def new
    @story = Story.find(params[:format])
    @page = Page.new
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def create
    @story = Story.find(params[:story_id])
    @page = @story.pages.build(page_params)
    if @page.save
      flash[:info] = "You've just submitted a page!" 
      redirect_to add_choices_page_url(@page.id)
    else
      render 'new'
    end
  end
  
  def index 
   
  end
  
  def add_choices
    @page = Page.find(params[:id])
  end
  
  private
  
  def page_params
    params.require(:page).permit(:page_title, :content)
  end
  


end

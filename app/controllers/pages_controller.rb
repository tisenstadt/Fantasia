class PagesController < ApplicationController
    

  def new
    @story = Story.find_by(params[:id])
    @page = Page.new
  end
  
  def show
    @page = Page.find_by(params[:id])
  end
  
  def create
    @story = Story.find_by(params[:page][:id])
    @page = @story.pages.build(page_params)
    if @page.save
      flash[:info] = "You've just submitted a page!" 
      redirect_to stories_path
    else
       render 'new'
    end
  end
  
  def index 
   
  end
  
  
  private
  
  def page_params
    params.require(:page).permit(:page_title, :content)
  end
  

end

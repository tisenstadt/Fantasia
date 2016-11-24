class ChoicesController < ApplicationController
  def create
     page = Page.find(params[:page_id])
     new_choice = page.choices.build(choice_params)
    
     if new_choice.save and page.choices.count == 1
         
         flash[:info] = "Choice Added!"
         redirect_to add_choices_page_url(page.id)
         
     
     else 
        redirect_to root_url
     end
  end
  
  private
  
  def choice_params
    params.require(:choice).permit(:content, :page_id)
  end
end

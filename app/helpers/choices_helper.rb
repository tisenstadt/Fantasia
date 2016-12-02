module ChoicesHelper
    def create_link(choice)
        choice.new_link #Use model to create new link. 
    end
    
      
    def update_link_with_new_page(choice, page)
        choice.update_link(page) #Use model to update link
    end
end

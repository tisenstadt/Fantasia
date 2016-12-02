module PagesHelper
    def update_page_depth(page)
        if page.pastchoice.nil?
            return
            
        else
            depth = page.pastchoice.page.depth + 1
            page.update_depth(depth)
        end
    end
    
    def group_pages_by_depth
        group = Page.all.group_by(&:depth)
    end
    
   
    
    def get_page(word, story)
        page = story.pages.find_by(page_title: word)
    end

   
        
        
         
            
            
            
        
end

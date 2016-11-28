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
    
    def generate_tree(root, html)
        html = "<li> #{root.page_title}"
        children = []
       
        root.choices.each do |choice| #i.e. check if children exist for the root node.
            if !choice.next_page.nil?
                children << choice
            end
        end
        if children.empty?
            html << "</li>"
            return html
        else 
            html << "<ul>"
            children.each do |page|
                 html << generate_tree(page.next_page, html)
            end
            html << "</ul>"
        end
        return html.html_safe
    
    end
    
    def get_page(word, story)
        page = story.pages.find_by(page_title: word)
    end

   
        
        
         
            
            
            
        
end

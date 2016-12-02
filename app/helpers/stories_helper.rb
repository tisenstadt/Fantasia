module StoriesHelper
    def generate_tree(root, html)
        return if root.choices.nil?
        html = "<li> #{root.page_title}"
        children = []
        
        root.choices.each do |choice| #i.e. parse existing choices to check for a page link
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
end


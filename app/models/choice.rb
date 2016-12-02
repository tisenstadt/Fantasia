class Choice < ActiveRecord::Base
    belongs_to :page
    has_one :link, foreign_key: "choice_id"
    has_one :next_page, through: :link, source: :page
    validates :content, presence: true
    validates :page_id, presence: true
    
    def new_link
        create_link
    end
  
    def update_link(page)
        my_id = id
        Link.find_by(choice_id: my_id).update_attribute(:page_id, page.id)
    end
end

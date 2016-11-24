class Choice < ActiveRecord::Base
    belongs_to :page
    validates :content, presence: true
    validates :page_id, presence: true
    
end

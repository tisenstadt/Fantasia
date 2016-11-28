class Page < ActiveRecord::Base
  belongs_to :story
  has_many :choices
  has_one :link
  has_one :pastchoice, through: :link, source: :choice 
  validates :page_title, presence: true, length: {maximum: 30}
  validates :content, presence: true
  
  def update_depth(depth)
    update_attribute(:depth, depth)
  end
end

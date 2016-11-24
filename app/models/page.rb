class Page < ActiveRecord::Base
  belongs_to :story
  validates :page_title, presence: true, length: {maximum: 30}
  validates :content, presence: true
end

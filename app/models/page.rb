class Page < ActiveRecord::Base
  belongs_to :story
  has_many :choices
  has_many :links
  validates :page_title, presence: true, length: {maximum: 30}
  validates :content, presence: true

end

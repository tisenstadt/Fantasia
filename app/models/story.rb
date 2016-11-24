class Story < ActiveRecord::Base
  has_many :active_stories
  has_many :pages
  validates :title, presence: true, length: {maximum: 30}
end

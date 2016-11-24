class Story < ActiveRecord::Base
  belongs_to :user
  has_many :pages
  validates :title, presence: true, length: {maximum: 30}
  

end

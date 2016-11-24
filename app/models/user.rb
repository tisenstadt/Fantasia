class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :active_stories, class_name: "ActiveStory", foreign_key: "user_id", dependent: :destroy
  has_many :stories, through: :active_stories, source: :story
end

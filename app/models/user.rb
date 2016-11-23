class User < ActiveRecord::Base
  has_many :storys
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

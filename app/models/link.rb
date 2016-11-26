class Link < ActiveRecord::Base
  belongs_to :choice
  belongs_to :page
end

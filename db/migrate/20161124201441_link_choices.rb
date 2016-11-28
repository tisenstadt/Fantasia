class LinkChoices < ActiveRecord::Migration
  def change
     add_reference :choices, :page, foreign_key: true
     
  end
end

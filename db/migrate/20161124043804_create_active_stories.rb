class CreateActiveStories < ActiveRecord::Migration
  def change
    create_table :active_stories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
   
  end
end

class AddContributionStatusToActiveStory < ActiveRecord::Migration
  def change
    add_column :active_stories, :can_contribute, :boolean, :default => true
  end
end

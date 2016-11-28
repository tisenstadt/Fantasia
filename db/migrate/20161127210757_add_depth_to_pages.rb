class AddDepthToPages < ActiveRecord::Migration
  def change
    add_column :pages, :depth, :integer, :default => 1
  end
end

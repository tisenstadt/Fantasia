class AddTitleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :page_title, :string
  end
end

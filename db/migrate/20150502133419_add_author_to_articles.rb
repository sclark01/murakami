class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author, :string
    remove_column :articles, :text, :string
  end
end


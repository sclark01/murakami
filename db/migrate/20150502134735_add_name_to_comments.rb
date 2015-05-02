class AddNameToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commenter, :string
    remove_column :comments, :body, :text
    add_column :comments, :name, :string
    add_column :comments, :desc, :text
    add_column :comments, :pageNum, :integer
  end
end

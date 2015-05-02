class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :topic
      t.text :opPost
      t.string :userName
      t.integer :userId
      t.references :comment, index: true

      t.timestamps
    end
  end
end

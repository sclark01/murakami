class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :userName
      t.integer :userId
      t.text :body
      t.references :discussion, index: true

      t.timestamps
    end
  end
end

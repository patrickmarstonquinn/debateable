class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.integer :debate_id

      t.timestamps

    end
  end
end

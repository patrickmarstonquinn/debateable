class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :liburl
      t.string :libtitle
      t.string :conurl
      t.string :contitle
      t.integer :user_id
      t.string :topic
      t.string :electionid

      t.timestamps

    end
  end
end

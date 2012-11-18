class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :lat
      t.string :lng
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end

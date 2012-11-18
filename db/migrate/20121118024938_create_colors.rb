class CreateColors < ActiveRecord::Migration
  def change
    create_table :colorhues do |t|
      t.string :name
      t.string :hex

      t.timestamps
    end
  end
end

class ChageLAtLongColumns < ActiveRecord::Migration
  def up
  	change_column :assets, :lat, :decimal, :precision => 9, :scale => 6
  	change_column :assets, :lng, :decimal, :precision => 9, :scale => 6
  end

  def down
  end
end

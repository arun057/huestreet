class ChangeColumnsAgain < ActiveRecord::Migration
  def up
  	change_column :assets, :lat, :float
  	change_column :assets, :lng, :float
  end

  def down
  end
end

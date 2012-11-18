class CreateHabtmTables < ActiveRecord::Migration
  def up
    create_table :collections_assets do |t|
      t.references :collection
      t.references :asset
    end
    add_index :collections_assets, [:collection_id, :asset_id]
    add_index :collections_assets, [:asset_id, :collection_id]

    create_table :colorhues_assets do |t|
      t.references :colorhue
      t.references :asset
      t.decimal :percent, :precision => 5, :scale => 2
    end
    add_index :colorhues_assets, [:colorhue_id, :asset_id]
    add_index :colorhues_assets, [:asset_id, :colorhue_id]
    add_index :colorhues_assets, [:percent]
  end

  def down
  	drop_table :collections_assets
  	drop_table :colorhues_assets
  end
end

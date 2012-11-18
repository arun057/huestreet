class ColorhuesAsset < ActiveRecord::Base
  attr_accessible :asset_id, :colorhue_id, :percent
  belongs_to :asset
  belongs_to :colorhue
end

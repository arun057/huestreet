class WelcomeController < ApplicationController
  def home
  	# @all_images = ColorhuesAsset.find(:all, :joins => "INNER JOIN assets AS Asset ON Asset.id=colorhues_assets.asset_id", :order => "Asset.created_at DESC", :group => 'Asset.id')
  	# @all_images = ColorhuesAsset.includes(:asset).group(:asset_id).order(:asset.created_on)
  	@all_images = ColorhuesAsset.find(:all, :include => [:asset], :order => "assets.created_at DESC", :group => 'assets.id')
  end
end

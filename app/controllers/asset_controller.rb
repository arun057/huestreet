class AssetController < ApplicationController
  def new
  	@asset = Asset.new(:user_id => session[:current_user])
  end

  def create
  	@asset = Asset.new(params[:asset])
    if @asset.save
      flash[:notice] = "Successfully created painting."
      redirect_to asset_path(@asset)
    else
      render :action => 'new'
    end
  end

  def show
  	@asset = Asset.find(params[:id])
  end
end

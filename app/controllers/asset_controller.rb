class AssetController < ApplicationController
  before_filter :authenticate_user , :only => [:new]
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

  def index
    @gmap_data = Asset.find(:all, :conditions => 'lng IS NOT NULL').to_gmaps4rails do |asset, marker|
      marker.infowindow render_to_string(:partial => "/asset/info", :locals => { :asset => asset})
      marker.picture({
        :rich_marker => "<div class=\"map_marker\"><img src=\"#{asset.image_url(:map_thumb)}\"/></div>"
       })
      # marker.title   "i'm the title"
      # marker.sidebar "i'm the sidebar"
      marker.json({ :id => asset.id})
    end
  end

end

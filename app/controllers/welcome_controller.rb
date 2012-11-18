class WelcomeController < ApplicationController
  before_filter :set_colors
  before_filter :authenticate_user , :only => [:user_uploads]

  def home
  	@all_images = ColorhuesAsset.find(:all, :include => [:asset], :order => "assets.created_at DESC", :group => 'assets.id')
  end

  def colors
  	@all_images = ColorhuesAsset.find(:all, :conditions => ["LOWER(colorhues.name)=? AND colorhues_assets.percent > 10", params[:color].downcase], :include => [:asset, :colorhue], :order => "colorhues_assets.percent DESC", :group => 'assets.id')
  	render 'home'
  end

  def set_colors
  	@all_colors = Colorhue.all
  end

  def user_uploads
    @all_images = ColorhuesAsset.find(:all, :include => [:asset], :order => "assets.created_at DESC", :group => 'assets.id', :conditions => ["assets.user_id = ?", session[:current_user]])
    render 'home'
  end
end

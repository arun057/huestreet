class WelcomeController < ApplicationController
  before_filter :set_colors
  before_filter :authenticate_user , :only => [:user_uploads]

  def home
  	@all_images = ColorhuesAsset.find(:all, :include => [:asset], :order => "assets.created_at DESC", :group => 'assets.id')
    @current_color = "rgba(0,166,81,1)";
  end

  def colors
  	@all_images = ColorhuesAsset.find(:all, :conditions => ["LOWER(colorhues.name)=? AND colorhues_assets.percent > 10", params[:color].downcase], :include => [:asset, :colorhue], :order => "colorhues_assets.percent DESC", :group => 'assets.id')
    color_hex = {
      "black" => "#000000",
      "blue" => "#0000FF",
      "brown" => "#754C24",
      "green" => "#00A651",
      "grey" => "#555555",
      "orange" => "#F26522",
      "red" => "#FF0000",
      "violet" => "#92278F",
      "white" => "#FFFFFF",
      "yellow" => "#FFFF00"
    }
    @current_color = color_hex[params[:color].downcase];
  	render 'home'
  end

  def set_colors
  	@all_colors = Colorhue.all
  end

  def user_uploads
    @all_images = ColorhuesAsset.find(:all, :include => [:asset], :order => "assets.created_at DESC", :group => 'assets.id', :conditions => ["assets.user_id = ?", session[:current_user]])
    @current_color = "rgba(0,166,81,1)"
    render 'home'
  end

end

class Colorhue < ActiveRecord::Base
  attr_accessible :hex, :name
  has_and_belongs_to_many :assets

  before_save :set_hex

  private
  def set_hex
  	color_hex = {
  		"Black" => "#000000",
  		"Blue" => "#0000FF",
  		"Brown" => "#754C24",
  		"Green" => "#00A651",
  		"Grey" => "#555555",
  		"Orange" => "#F26522",
  		"Red" => "#FF0000",
  		"Violet" => "#92278F",
  		"White" => "#FFFFFF",
  		"Yellow" => "#FFFF00"
  	}
  	self.hex = color_hex[self.name]
  end
end

class Asset < ActiveRecord::Base
  attr_accessible :image, :lat, :lng, :user_id
  mount_uploader :image, AssetUploader

  has_and_belongs_to_many :collections
  has_and_belongs_to_many :colorhues
  belongs_to :user
  has_many :colorhuesAsset
  after_save :create_color_association

  acts_as_gmappable :process_geocoding => false, :lat => "lat", :lng => "lng"

  private

  def create_color_association
    newImage = ColorPercentage::ImageColor.new(self.image_url)
    color_composition = newImage.find_color
    color_composition.each do | color, percent |
      color_exists = Colorhue.find_by_name(color)
      if color_exists.nil?
      	# create color
      	color_exists = Colorhue.new :name => color
      	color_exists.save
      end
      #add to the color
      percent = (percent * 100).round / 100.0
      cha = ColorhuesAsset.new :asset_id => self.id, :colorhue_id => color_exists.id, :percent => percent
      cha.save
    end
  end

end

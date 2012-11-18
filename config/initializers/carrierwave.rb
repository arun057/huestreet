CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['HUE_AWS_ACCESS_KEY'],       # required
    :aws_secret_access_key  => ENV['HUE_AWS_SECRET']       # required
    # :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'huestreet'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.asset_host     = 'https://assets.example.com'            # optional, defaults to nil
end
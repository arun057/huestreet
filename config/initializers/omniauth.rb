Rails.application.config.middleware.use OmniAuth::Builder do
  provider :singly, ENV['HUE_SINGLY_ID'], ENV['HUE_SINGLY_SECRET']
end
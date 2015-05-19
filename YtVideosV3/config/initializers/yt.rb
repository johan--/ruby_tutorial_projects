Yt.configure do |config|
  # Enable these options in APIs page at Google developer console
  # Google+ API
  # YouTube Analytics API
  # YouTube Data API v3
  config.api_key = ENV['YOUTUBE_APP_ID']

  #  config.log_level = :debug
end

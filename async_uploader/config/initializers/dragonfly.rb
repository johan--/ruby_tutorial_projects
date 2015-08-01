require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "132b4186025c8d3055fc0422c195848fade5d9b3123e81d9b541993f776da5d4"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end

if Rails.env.development? || Rails.env.test?
  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
else
  datastore :s3,
    bucket_name: 'your_bucket_name',
    access_key_id: ENV['AWS_KEY'],
    secret_access_key: ENV['AWS_SEC'],
    url_scheme: 'https'
end

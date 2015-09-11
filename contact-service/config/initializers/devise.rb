Devise.setup do |config|
  config.secret_key = '6e059f15248c9c26e7208a4a1129029c13f4a0fcef629562c34a4b3f0b1bbcbb8ed1431728cdbc6fe6e6bc4ed0f90cc9fc701c962e63be107e0bfd021eb70f08'
  config.mailer_sender = 'a@example.com'
  require 'devise/orm/active_record'
  config.authentication_keys = [:email] 
  config.case_insensitive_keys = [:email ]
  config.strip_whitespace_keys = [:email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.password_length = 8..128
end

Rails.application.routes.draw do
  post '/generate' => 'verifications#generate_code'
  post '/verify' => 'verifications#verify_code'
end

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
RailsApiAuthWithWarden::Application.config.secret_token = 'c3c38873501610fe7fbcf5cd8a3b039dfa217cb50a3a30f9a92fdd64613cf178c51ea7f758b946e689188d73c62dc33ae5232b4a93ae5aaa7ca7284a2fe079ac'

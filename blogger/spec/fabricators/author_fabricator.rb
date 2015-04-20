Fabricator(:author) do
  username { Faker::Name.name }
  email { |attrs| Faker::Internet.email(attrs[:name]) }
  password 'password'
  password_confirmation 'password'
end



Fabricator(:company) do
  name { Faker::App.name }
  user
end

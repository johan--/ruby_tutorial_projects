Fabricator(:user) do
  name { Faker::Name.name }
  provider "twitter"
  uid {Fabricate.sequence(:uid)}
end

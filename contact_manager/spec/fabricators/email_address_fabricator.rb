Fabricator(:email_address) do
  address { Faker::Internet.email }
  contact_id { Fabricate(:person).id }
  contact_type "Person"
end

Fabricator(:email_address_from_company, from: :email_address) do
  contact_id { Fabricate(:company).id }
  contact_type "Company"
end

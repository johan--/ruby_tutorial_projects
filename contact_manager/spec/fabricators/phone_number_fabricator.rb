Fabricator(:phone_number) do
  number { Faker::PhoneNumber.phone_number }
  contact_id { Fabricate(:person).id }
  contact_type "Person"
end

Fabricator(:phone_number_from_company, from: :phone_number) do
  contact_id { Fabricate(:company).id }
  contact_type "Company"
end

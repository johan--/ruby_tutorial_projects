Fabricator(:email_address) do
  address "email@example.com"
  contact_id { Fabricate(:person).id }
  contact_type "Person"
end

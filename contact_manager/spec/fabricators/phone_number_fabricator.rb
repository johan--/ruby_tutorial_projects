Fabricator(:phone_number) do
  number "1234567890"
  contact_id { Fabricate(:person).id }
  contact_type "Person"
end

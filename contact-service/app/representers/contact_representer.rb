class ContactRepresenter < Napa::Representer
  property :id, type: String
  property :name
  property :phone
  property :email
end

class PhoneNumber < ActiveRecord::Base
  belongs_to :contact, polymorphic: true
  validates_presence_of :number, :contact_id
end

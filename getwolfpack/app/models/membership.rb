class Membership < ActiveRecord::Base
  belongs_to :account
  belongs_to :user

  validates_presence_of :account, :user
  validates :role, inclusion: { in: SYSTEM_ROLES }
end

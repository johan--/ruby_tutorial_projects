class Account < ActiveRecord::Base
  validates_presence_of :name, :subdomain
  validates :subdomain,
    format: { with: /\A[a-z][a-z0-9\-]+[a-z0-9]\Z/ },
    uniqueness: true
end

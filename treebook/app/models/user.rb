class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses
  validates_presence_of :first_name

  validates_presence_of :last_name

  validates :profile_name,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[a-zA-Z0-9_\-]+\z/,
              message: 'Must be formatted correctly.'
            }

    def full_name 
      first_name + " " + last_name
    end

    def to_param 
      profile_name
    end
end

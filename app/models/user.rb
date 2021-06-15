class User < ApplicationRecord
    has_secure_password
    has_many :accounts
    has_many :banks, through: :accounts
    validates_presence_of :name, :email
    validates_uniqueness_of :email
    
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.name = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end

class User < ApplicationRecord
    has_secure_password
    has_many :accounts
    has_many :banks, through: :accounts
    validates_presence_of :name, :age, :dob, :gender, :username
    validates_uniqueness_of :username
end

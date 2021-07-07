class Bank < ApplicationRecord
    #has_many :accounts 
    #has_many :users, through: :accounts 
    validates_presence_of :name, :address, :phone_number, :logo
    scope :order_by_name, -> { order(:name) }
  
end

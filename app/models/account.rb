class Account < ApplicationRecord
    belongs_to :user
    belongs_to :bank
    validates_presence_of :account_number, :routing_number, :balance
end

class BanksController < ApplicationController

    def index
        @banks = Bank.order_by_name
    end

end
class AccountsController < ApplicationController

    def new 
        bank = Bank.find(params[:bank_id])
        @account = Account.new(bank: bank)
    end

    def create
        @account = current_user.accounts.build(account_params)
        if @account.save 
            redirect_to account_path(@account)
        else 
           render :new
        end
    end
   
    def index
        if params[:bank_id]
            bank = Bank.find(params[:bank_id])
            @accounts = current_user.accounts.where(bank: bank).order_by_balance
        else
            @accounts = current_user.accounts.order_by_balance
        end
    end

    def show
        @account = current_user.accounts.find(params[:id])
    end

    def edit
        @account = current_user.accounts.find(params[:id])
        
    end
    
    def update
        @account = current_user.accounts.find(params[:id])
       if @account.update(account_params)
        redirect_to accounts_path
       else
        render :edit
       end
    end

    def destroy
        @account = current_user.accounts.find(params[:id])
        @account.destroy
        redirect_to accounts_path
     end

    private

    def account_params
        params.require(:account).permit(:account_number, :routing_number, :balance, :bank_id)
    end

end
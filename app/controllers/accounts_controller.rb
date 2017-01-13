class AccountsController < ApplicationController
    
    def index
       @customer = Customer.find(params[:customer_id])
       @projects = @customer.projects
       @payments = @customer.payments
    end
    
end
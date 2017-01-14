class Customer < ActiveRecord::Base
    has_many :projects
    has_many :payments
    
    validates_uniqueness_of :name
    
    
    def self.calculate_total_cost_incurred(customer)
        projects = customer.projects
        total_cost = 0.0
        projects.each do |project|
            project.costs.each do |cost|
                total_cost += cost.cost    
            end
        end
        total_cost
    end
    
    
    def self.calculate_total_payment(customer)
        payments = customer.payments
        total_payment = 0.0
        return 0.0 if payments.size < 1
        payments.each do |payment|
           total_payment += payment.amount 
        end
        total_payment
    end
end

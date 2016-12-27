class Project < ActiveRecord::Base
    before_save :check_complete
    
    has_many :project_logs
    
    validates :name, presence: true, uniqueness: {case_sensitive: false }
    validates :description, presence:true
    
    
    def check_complete
        puts self.project_complete
       if self.project_complete
           self.completed_time  = Time.now
       else
           self.completed_time = nil
       end
       puts 'went in here'
    end
end
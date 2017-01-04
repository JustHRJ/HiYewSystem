class Project < ActiveRecord::Base
    before_save :check_complete
    has_many :images
    has_many :project_logs
    has_many :costs
    validates :name, presence: true, uniqueness: {case_sensitive: false }
    validates :description, presence:true
    
    
    def check_complete
        puts self.project_complete
       if self.project_complete
           self.completed_time  = Time.now
       else
           self.completed_time = nil
       end
    end
    
    def self.search_by_name(param)
        return Project.none if param.blank?
        param.strip!
        param.downcase!
        (name_matches('name', param)).uniq
    end
    
    def self.name_matches(name, param)
         matches(name, param)
    end
    
    def self.matches(field_name, param)
        where("lower(#{field_name}) like ?", "%#{param}%")
    end
end
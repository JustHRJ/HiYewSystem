class ProjectsController < ApplicationController
   
   def new
       @project = Project.new
   end
   
   def create
       @project = Project.new(project_params)
       customer = Customer.find_by(:name => params[:project][:customer])
       @project.customer = customer
       if @project.save
           flash[:success] = "Project has been successfully saved"
           redirect_to project_path(@project)
           
       else
           render 'new'
       end
       
   end
   
   def show
        @project = Project.find(params[:id])
   end
   
   def index
        @projects = Project.all
   end
   
   def edit
       @project = Project.find(params[:id])
   end
   
   def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
           flash[:success] = "Project has been successfully edited"
           redirect_to project_path(@project)
        else
           render 'edit'
        end
   end
   
   def search
        if params[:project]
            if params[:project]  == 'completed'
               @project = Project.where(:project_complete => true)
               elsif prarams[:project] == 'incompleted'
                @project = Project.where(:project_complete => false)   
               else
                @project = Project.search_by_name(params[:project])
            end
            
            if @project
                render partial: 'lookup'
            else
                render status: :not_found, nothing:true
            end
        end
   end
    
    
    private
    def project_params
        params.require(:project).permit(:name, :description, :start_date, :end_date, :project_complete)
    end
end
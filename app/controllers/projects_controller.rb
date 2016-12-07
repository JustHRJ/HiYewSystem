class ProjectsController < ApplicationController
   
   def new
       @project = Project.new
   end
   
   def create
       @project = Project.new(project_params)
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
    
    
    private
    def project_params
        params.require(:project).permit(:name, :description, :start_date, :end_date)
    end
end
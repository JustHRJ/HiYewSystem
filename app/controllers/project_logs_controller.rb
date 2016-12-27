class ProjectLogsController < ApplicationController
   
    def new
        @project = Project.find(params[:project_id])
        @project_log = ProjectLog.new
    end
    
    def create
        @project = Project.find(params[:project_id])
        @project_log = ProjectLog.new(project_log_params)
        @project_log.project = @project
        
        @project_log.save
        redirect_to project_path(@project)
    end
    
    def edit
        @project = Project.find(params[:project_id])
        @project_log = ProjectLog.find(params[:id])
    end
    
    def update
        @project_log = ProjectLog.find(params[:id])
        @project_log.update(project_log_params)
        redirect_to project_path(@project_log.project)
    end
    
    def show
        @project = Project.find(params[:project_id])
        @project_log = ProjectLog.find(params[:id])
    end
    
    def destroy
        @project = Project.find(params[:project_id])
        @project_log = ProjectLog.find(params[:id])
        @project_log.destroy
        redirect_to project_path(@project)
    end
    
    private 
    def project_log_params
        params.require(:project_log).permit(:heading, :details)
    end
end
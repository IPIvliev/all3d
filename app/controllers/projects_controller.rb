class ProjectsController < InheritedResources::Base
	def index
		@projects = Project.where("active = ?", true).order('projects.created_at DESC').page(params[:page]).per(15)

	    if params[:search]
	      @projects = Project.where("active = ?", true).search(params[:search]).order("projects.created_at DESC").page(params[:page]).per(15)
	    else
	      @projects = Project.where("active = ?", true).order('projects.created_at DESC').page(params[:page]).per(15)
	    end  
	end
	
  private

    def project_params
      params.require(:project).permit(:title, :description, :projectimage, :active, :user_id, :comments_count, :posts_count, :models_count, :products_count)
    end
end


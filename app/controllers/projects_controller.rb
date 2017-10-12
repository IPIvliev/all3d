class ProjectsController < InheritedResources::Base
	def index
		@projects = Project.where("active = ?", true).order('projects.created_at DESC').page(params[:page]).per(15)

	    if params[:search]
	      @projects = Project.where("active = ?", true).search(params[:search]).order("projects.created_at DESC").page(params[:page]).per(15)
	    else
	      @projects = Project.where("active = ?", true).order('projects.created_at DESC').page(params[:page]).per(15)
	    end  
	    
	end

	def show
		@project = Project.find(params[:id])
    	set_meta_tags :title => @project.title,
              :description => @project.description,
              :keywords => @project.keywords,
              :canonical => request.base_url + request.original_fullpath 		
	end
	
  def user_projects
    @projects = current_user.projects.order('projects.created_at DESC').page(params[:page]).per(15)
  end

  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |file|
            @project.projectimages.create(image: file)
          }
        end        
        format.html { redirect_to @project, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_gallery
    @project = Project.find(params[:project])
    render "/projects/projectimages/_edit_project_gallery"
  end

  def edit_gallery
  	@project = Project.find(params[:project])
      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |file|
          @project.projectimages.create(image: file)
        }
      end  
    respond_to do |format|
    	if @project.save
        format.html { redirect_to @project, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_projectimage
    @image = Projectimage.find(params[:image])
    @image.destroy
    redirect_to :back
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :projectimage, :active, :user_id, :comments_count, :posts_count, :models_count, :products_count)
    end
end


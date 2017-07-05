require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { active: @project.active, comments_count: @project.comments_count, description: @project.description, models_count: @project.models_count, posts_count: @project.posts_count, products_count: @project.products_count, projectimage: @project.projectimage, title: @project.title, user_id: @project.user_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { active: @project.active, comments_count: @project.comments_count, description: @project.description, models_count: @project.models_count, posts_count: @project.posts_count, products_count: @project.products_count, projectimage: @project.projectimage, title: @project.title, user_id: @project.user_id }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end

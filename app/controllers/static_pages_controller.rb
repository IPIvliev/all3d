class StaticPagesController < ApplicationController
  def index
  	I18n.locale = :ru
  	@posts = Post.where("active = ?", true).order('posts.created_at DESC').page(params[:page]).per(5)
  end

  def contacts

  end
end

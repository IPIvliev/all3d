class StaticPagesController < ApplicationController
  def index
  	I18n.locale = :ru
  	@posts = Post.where("active = ?", true).order('posts.created_at DESC').page(params[:page]).per(5)

    set_meta_tags description: "Интерактивный портал о мире 3d принтеров. Здесь вы найдёте актуальную информацию о развитии индустрии 
              3d-печати, модели в формате stl, сможете создать свой проект и поделиться информацией о его развитии с полизователями 
              сети.",
              keywords: "3d, 3d принтеры, 3d модели, адаптивное производство, новости, распечатать модель, stl, слайсер, dlp, fdm, принтеры, сканер"
  end

  def contacts
    set_meta_tags :description => "Есть вопрос по 3d-печати? Свяжитесь в администратором портала Адаптивные технологии.",
              :keywords => "вопросы по 3d-печати, адаптивные технологии"

  end
end

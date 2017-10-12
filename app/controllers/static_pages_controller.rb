class StaticPagesController < ApplicationController
  def index
  	I18n.locale = :ru
  	@posts = Post.where("active = ?", true).order('posts.created_at DESC').page(params[:page]).per(5)

    set_meta_tags description: "Интерактивный портал о 3d индустрии. Здесь вы найдёте актуальную информацию о 3d-печати, модели в формате stl, сможете создать свой проект и поделиться новостями о его развитии.",
              keywords: "3d, 3d принтеры, 3d модели, аддитивное производство, адаптивное производство, новости, распечатать модель, stl, слайсер, dlp, fdm, sla, принтеры, сканер"
  end

  def contacts
    set_meta_tags :description => "Есть вопрос по 3d-печати? Свяжитесь в администратором портала Адаптивные технологии.",
              :keywords => "вопросы по 3d-печати, адаптивные технологии"

  end
end

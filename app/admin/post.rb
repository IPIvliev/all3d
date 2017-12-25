ActiveAdmin.register Post do
	permit_params :title, :title_en, :title_ru, :text, :active, :description, :keywords, :user_id

	menu label: "Статьи"

  index do
    selectable_column
    id_column
    column "Наименование EN", :title_en
    column "Наименование RU", :title_ru

    column "Опубликовано", :active
    column "SEO" do |post|
      if post.description.present? && post.keywords.present?
        "+/+"
      elsif post.description.present? && post.keywords.blank?
        "+/-"
      elsif post.description.blank? && post.keywords.present?
        "-/+"
      else
        "-/-"
      end
    end
    column "Дата публикации", :created_at
    actions
  end

  form do |f|
    f.inputs "Изменить статью" do
      f.input :user_id, :input_html => { :value => 1 }, as: :hidden
      f.input :title_en
      f.input :title_ru
      f.input :description, :input_html=> { :rows => 2 }

      f.input :keywords, :input_html=> { :rows => 1 }
      f.input :text, :as => :ckeditor, input_html: { ckeditor: { height: 800 } },
      label: false
      if post.text_en.present?
        div do
        	div post.text_en.html_safe
        end
      end
      f.input :active
    end
    f.actions
  end

  show do
    panel "Статья" do
      table_for post do
        column :id
        column "Наименование", :title
        column "Опубликовано", :active
        column :description
        column :keywords
      end
      if post.text
	      div do
	      	simple_format post.text.html_safe
	      end 
	  else
	  	div do
	  		"Нет русского перевода"
	  	end
	  end
    end
    active_admin_comments
  end

end

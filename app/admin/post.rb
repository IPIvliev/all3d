ActiveAdmin.register Post do
	permit_params :title, :title_en, :title_ru, :text, :active

	menu label: "Статьи"

  index do
    selectable_column
    id_column
    column "Наименование EN", :title_en
    column "Наименование RU", :title_ru
    column "Опубликовано", :active
    column "Дата публикации", :created_at
    actions
  end

  form do |f|
    f.inputs "Изменить статью" do
      f.input :title_en
      f.input :title_ru
      f.input :text, :as => :ckeditor
      div do
      	div post.text_en.html_safe
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

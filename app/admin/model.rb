ActiveAdmin.register Model do
	permit_params :title, :description, :active
	menu label: "Модели"

  index do
    selectable_column
    id_column
    column "Название", :title
    column "Активно", :active
    column "Дата публикации", :created_at
    actions
  end

  form do |f|
    f.inputs "Изменить модель" do
      f.input :title
      f.input :description
      f.input :active
    end
    f.actions
  end  

  show do
    panel "Детали модели" do
      table_for model do
        column :id
        column "Наименование", :title
        column "Опубликовано", :active
      end
      div do
      	simple_format model.description
      end  
    end
    active_admin_comments
  end
end

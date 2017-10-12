ActiveAdmin.register Project do
	permit_params :title, :description, :active, :logo, :background

	menu label: "Проекты"

  index do
    selectable_column
    id_column
    column "Наименование", :title
    column "Опубликовано", :active
    column "Дата публикации", :created_at
    actions
  end

  form do |f|
    f.inputs "Изменить проект" do
      f.input :title
      f.input :description
      f.input :active
    end
    f.actions
  end

  show do
    panel "Проект" do
      table_for project do
        column :id
        column "Наименование", :title
        column "Опубликовано", :active
        column :description
      end
    end
    active_admin_comments
  end

end

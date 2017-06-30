ActiveAdmin.register Article do
	permit_params :title, :description, :text, :active, :ancestry

	menu label: "3D википедия"

  index do
    selectable_column
    id_column
    column "Название", :title
    column "Родитель", :parent_id
    column "Активно", :active
    column "Дата публикации", :created_at
    actions
  end

end

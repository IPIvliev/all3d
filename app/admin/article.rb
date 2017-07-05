ActiveAdmin.register Article do
	permit_params :title, :description, :text, :active, :ancestry, :keywords

	menu label: "3D википедия"

  index do
    selectable_column
    id_column
    column "Название", :title
    column "Родитель", :parent_id
    column "SEO" do |article|
      if article.description.present? && article.keywords.present?
        "+/+"
      elsif article.description.present? && article.keywords.blank?
        "+/-"
      elsif article.description.blank? && article.keywords.present?
        "-/+"
      else
        "-/-"
      end
    end
    column "Активно", :active
    column "Дата публикации", :created_at
    actions
  end

end

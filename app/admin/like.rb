ActiveAdmin.register Like do
  permit_params :ip

  index do
    selectable_column
    id_column
    column :ip
    column :created_at
    column :updated_at
    actions
  end

  filter :ip
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Like Details" do
      f.input :ip
    end
    f.actions
  end

end

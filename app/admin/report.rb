ActiveAdmin.register Report do
  permit_params :ip, :deed_id

  index do
    selectable_column
    id_column
    column :ip
    column :deed
    column :created_at
    column :updated_at
    actions
  end

  filter :ip
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Report Details" do
      f.input :ip
      f.input :deed
    end
    f.actions
  end

end

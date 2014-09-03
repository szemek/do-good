ActiveAdmin.register Deed do
  permit_params :person, :action, :happiness

  index do
    selectable_column
    id_column
    column :person
    column :action
    column :happiness
    column :created_at
    actions
  end

  filter :person
  filter :action
  filter :happiness
  filter :created_at

  form do |f|
    f.inputs "Deed Details" do
      f.input :person
      f.input :action
      f.input :happiness
    end
    f.actions
  end

end

ActiveAdmin.register InboundEmail do
  permit_params :sender, :content

  index do
    selectable_column
    id_column
    column :sender
    column :content
    column :created_at
    actions
  end

  filter :sender
  filter :created_at

  form do |f|
    f.inputs "InboundEmail Details" do
      f.input :sender
      f.input :content
    end
    f.actions
  end
end

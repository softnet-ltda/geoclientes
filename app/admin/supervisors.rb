ActiveAdmin.register Supervisor do
  index :title => "Supervisores" do
    column :email
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :email
		  f.input :password, :label => "Contrasena"
		  f.input :password_confirmation, :label => "Confirme Contrasena"
	  end
      f.actions
  end
  show :title => "Detalles Supervisor" do |v|
	  attributes_table do
		  row :email
	  end
  end
end

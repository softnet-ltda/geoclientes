ActiveAdmin.register User do
  index :title => "Usuarios" do
    column :name, :label => "Nombre"
    column :email, :label => "Email"
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :name, :label => "Nombre"
		  f.input :email, :label => "Email"
		  f.input :password, :label => "Contrasena"
		  f.input :password_confirmation, :label => "Confirme Contrasena"
	  end
	  f.actions
  end
  show :title => "Detalles Cliente" do |v|
	  attributes_table do
		  row :name, :label => "Nombre"
		  row :email, :label => "Email"
	  end
  end
end

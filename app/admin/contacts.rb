ActiveAdmin.register Contact do
  index do                            
    column :name, :label => "Nombre"        
    column :email, :label => "Email"                     
    column :phone, :label => "Telefono"           
    column :position, :label => "Cargo"             
    default_actions                   
  end                                 
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :name, :label => "Nombre"
		  f.input :email, :label => "Email"
		  f.input :phone, :label => "Telefono"
		  f.input :position, :label => "Cargo"
	  end
	  f.actions
  end
  show :title => "Detalles Contacto" do |v|
	  attributes_table do
		  row :name, :label => "Nombre"
		  row :email, :label => "Email"
		  row :phone, :label => "Telefono"
		  row :position, :label => "Cargo"
	  end
  end
end

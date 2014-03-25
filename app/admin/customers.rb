ActiveAdmin.register Customer do
  index do                            
    column :name, :label => "Nombre"        
    column :address, :label => "Direccion"
    default_actions                   
  end                                 
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :name, :label => "Nombre"
		  f.input :address, :label => "Direccion"
	  end
	  f.actions
  end
  show :title => "Detalles Cliente" do |v|
	  attributes_table do
		  row :name, :label => "Nombre"
		  row :address, :label => "Direccion"
	  end
  end
end

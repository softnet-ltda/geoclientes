ActiveAdmin.register Event do
  index do                            
    column :date        
    column :status
	column :type, :label => "Tipo"
    default_actions                   
  end                                 
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :date, :as => :datepicker, :label => "Fecha"
		  f.input :status
		  f.input :type, :label => "Tipo"
	  end
	  f.actions
  end
  show :title => "Detalles Evento" do |v|
	  attributes_table do
		  row :date, :label => "Fecha"
		  row :status
		  row :type, :label => "Tipo"
	  end
  end
end

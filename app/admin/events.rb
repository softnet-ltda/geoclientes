ActiveAdmin.register Event do
  index :title => "Eventos" do
    column :date, :label => "Fecha"
    column :status
	column :type, :label => "Tipo"
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :date, :as => :datepicker, :label => "Fecha"
		  f.input :date, :as => :time_picker, :label => "Hora"
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

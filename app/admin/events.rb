ActiveAdmin.register Event do
  index :title => "Eventos" do
    column :date, :label => "Fecha"
    column :status
	column :event_type, :label => "Tipo"
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
	  f.inputs "Details" do
		  f.input :date, :as => :datepicker, :label => "Fecha"
		  f.input :date, :as => :time_picker, :label => "Hora"
		  f.input :status
		  f.input :event_type, :label => "Tipo"
		  f.input :user, :label => "Usuario"
		  f.input :contact, :label => "Cliente"
	  end
	  f.actions
  end
  show :title => "Detalles Evento" do |v|
	  attributes_table do
		  row :date, :label => "Fecha"
		  row :status
		  row :event_type, :label => "Tipo"
	  end
  end
end

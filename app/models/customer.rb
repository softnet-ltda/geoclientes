class Customer < ActiveRecord::Base
  attr_accessible :address, :name, :latutude, :longitude, :account
  has_many :contacts
  has_many :sucursales
  geocoded_by :address
  after_validation :geocode
  def switch_status!
  	status = !status
	self.save
  end
end

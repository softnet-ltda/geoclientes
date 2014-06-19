class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :position, :customer_id
  has_many :events
  belongs_to :customer
end

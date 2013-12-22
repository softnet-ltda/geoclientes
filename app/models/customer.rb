class Customer < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :contacts
end

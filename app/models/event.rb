class Event < ActiveRecord::Base
  attr_accessible :date, :status, :type
  belongs_to :user
  belongs_to :contact
end

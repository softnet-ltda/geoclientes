class Event < ActiveRecord::Base
  attr_accessible :date, :status, :type, :user_id, :contact_id
  belongs_to :user
  belongs_to :contact
end

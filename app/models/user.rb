class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by [:latitude, :longitude]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :role, :supervisor_id, :account
  has_many :events
  has_many :customers
  belongs_to :user, foreign_key: "supervisor_id"
  has_many :users, foreign_key: "supervisor_id"

  after_save :set_role

  def set_role
	  if self.role.nil?
		  if self.invited_by_id.nil?
			  self.role = 0
			  self.account = self.id
			  self.save
		  end
		  if !self.invited_by_id.nil?
			  self.role = 2
			  self.account = self.invited_by.account
			  self.save
		  end
	  end
  end

  def role_s
	  if self.role == 2
		  return "Usuario"
	  elsif self.role == 1
		  return "Supervisor"
	  elsif self.role == 0
		  return "Admin"
	  end
  end

end

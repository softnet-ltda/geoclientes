class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :role, :supervisor_id
  has_many :events
  has_many :customers
  belongs_to :user, foreign_key: "supervisor_id"
  has_many :users, foreign_key: "supervisor_id"
end

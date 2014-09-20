class User < ActiveRecord::Base
  has_merit
  acts_as_marker

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many:authorizations
  acts_as_commontator
  has_many :widgets, through: :buckets
  has_many :buckets
end

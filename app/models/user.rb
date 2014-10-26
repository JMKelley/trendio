class User < ActiveRecord::Base
  acts_as_commontator
  has_merit
  mount_uploader :avatar, AvatarUploader
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true

  has_many :authorizations

  has_many :widgets, through: :buckets
  has_many :buckets

   # Send a welcome email after the user has been created
  after_create { |u| u.send_email(:welcome) }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :avatar, :avatar_cache, :remove_avatar
  # attr_accessible :title, :body

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Sends an email to the user, using the unique identifier
  # for the email template. All Emails are enqueued as a
  # {UserMailerJob} and subsequently processed by a worker
  # in the {UserMailer} class.
  #
  # @param [Symbol] key of the email to send to the user.
  def send_email(key)
    job = UserMailerJob.new(key.to_sym, id)
    Delayed::Job.enqueue job
  end

  # bypasses Devise's requirement to re-enter current password to edit
  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  
end

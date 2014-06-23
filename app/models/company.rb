class Company < ActiveRecord::Base

  has_many :products, dependent: :destroy

	attr_accessor :password

	 validates :name, presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: { minimum: 6 }

    #validate confirmation of password
    # validates_confirmation_of :password, message: "confirmation does not match"
    # validates_presence_of :password_confirmation, if: :password_changed?
    
  	#hash the password before user data saved
  	before_save :hash_password

    validates :password, :presence =>true, :confirmation => true, :length => { :within => 6..40 }, :on => :create

    validates :password, :confirmation => true, :length => { :within => 6..40 }, :on => :update, :unless => lambda{ |user| user.password.blank? } 
    #hash the password before user data saved
    before_save :hash_password

    #downcase all email to quarantee its uniqueness
    before_save { self.email = email.downcase }

  	def authenticate(password)
  		self.password_digest == BCrypt::Engine.hash_secret(password, self.salt)
  	end

  	private
  	# method to generate store salt, hash user password, set password field nil since no such attribute in database
  	def hash_password
  		self.salt = BCrypt::Engine.generate_salt
  		self.password_digest = BCrypt::Engine.hash_secret(self.password, self.salt)
  		self.password = nil
  	end
end

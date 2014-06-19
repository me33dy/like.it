class Company < ActiveRecord::Base

	attr_accessor :password, :password_confirmation
	validates :name, presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: { minimum: 6 }


  	#hash the password before user data saved
  	before_save :hash_password

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

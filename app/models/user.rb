class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

 #  def self.new_with_session(params, session)
	#   super.tap do |user|
	#  	if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	#    	user.email = data["email"] if user.email.blank?
	#    	end
	#  	end
	# end

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
  # def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      user = User.create(fullname:auth.info.name,                                             
      provider:auth.provider,
      uid:auth.uid,
      email:auth.info.email,
      password:Devise.friendly_token[0,14])
    end
  end



end

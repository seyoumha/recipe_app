class UserMailer < ActionMailer::Base
  default from: "seyoumha@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://in2grub.com'
  	mail(to: @user.email, subect: 'Welcome to in2grub.com')
  end

 	
end

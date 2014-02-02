class UserMailer < ActionMailer::Base
  default from: "seyoumha@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'recipeApp.com'
  	mail(to: @user.email, subect: 'Welcome to Recipe App')
  end
end

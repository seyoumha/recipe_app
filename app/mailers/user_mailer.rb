class UserMailer < ActionMailer::Base
  default from: "seyoumha@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://in2grub.com'
  	mail(to: @user.email, subect: 'Welcome to in2grub.com')
  end

 	def pdf_email(pdf=nil, user)
 		@user = user
 		attachments['pdf.html.haml'] = pdf if pdf.present?
  		mail :to => '@user.email', :subject => 'in2grub Shopping List'
	end
end

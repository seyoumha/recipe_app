class ShoppingCart < ActionMailer::Base
  default from: "seyoumha@gmail.com"

def pdf_email(user, pdf)
 		@user = user
 		attachments['email_pdf.html.erb'] = pdf if pdf.present?
  		mail :to => '@user.email', :subject => 'in2grub Shopping List'
	end


end

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RecipeApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'app34095575@heroku.com',
  :password => 'dz2elhio7516',
  :domain => 'http://in2food.herokuapp.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


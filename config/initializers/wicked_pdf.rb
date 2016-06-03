# WickedPdf.config = {
#   #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
#   #:layout => "pdf.html",
#   :exe_path => '#{/usr/local/bin/wkhtmltopdf'
# }
# 
if Rails.env.production?
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
else
  wkhtmltopdf_path = "/Users/hanna/.rvm/gems/ruby-2.2.2/bin/wkhtmltopdf"            
end
 
WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path }


require 'rubygems'
require 'tlsmail'
require 'mail'
def send_log_mail(s_mail_bool)
	from = 'cigureanu.a@gmail.com'
	pass = 'c85008377'
	to = 'cigualex@gmail.com'	
	if s_mail_bool
		s_mail = Mail.new do
      			from 'cigureanu.a@gmail.com'
        		to 'cigualex@gmail.com'
   			subject "Successfull compilation"
      			body 'Fuck yeah'  # add an attachment via add_file
      		end
      	
      		Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
		response = Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', from, pass, :login) do |smtp|
			smtp.send_message(s_mail.to_s, from, to)
  		end
	else
		f_mail = Mail.new do
      			from 'cigureanu.a@gmail.com'
        		to 'cigualex@gmail.com'
   			subject "Failed Compilation"
      			body 'No fuck yeah'  # add an attachment via add_file
		end

		Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
		response = Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', from, pass, :login) do |smtp|
			smtp.send_message(f_mail.to_s, from, to)
  		end

	end
	
end
#start script
send_log_mail(true)

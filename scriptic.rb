
require 'rubygems'
require 'tlsmail'
require 'mail'

$filename = ARGV[0]
puts $filename
$extension = ARGV[1]
puts $extension
$successmail = false
def send_log_mail(s_mail_bool)
	from = 'cigualex@gmail.com'
	pass = 'c85008377'
	to = 'cigureanu.a@gmail.com'	
	if s_mail_bool
		s_mail = Mail.new do
      			from 'cigualex@gmail.com'
        		to 'cigureanu.a@gmail.com'
   			subject "Successfull compilation"
      			body 'Fuck yeah'  # add an attachment via add_file
      		end
      	
      		Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
		response = Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', from, pass, :login) do |smtp|
			smtp.send_message(s_mail.to_s, from, to)
  		end
	else
		f_mail = Mail.new do
      			from 'cigualex@gmail.com'
        		to 'cigureanu.a@gmail.com'
   			subject "Failed Compilation"
      			body 'No fuck yeah'  # add an attachment via add_file
		end

		Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
		response = Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', from, pass, :login) do |smtp|
			smtp.send_message(f_mail.to_s, from, to)
  		end

	end
	
end

def compile_file()
	case $extension
		when 'c'
			if system( 'g++ /home/alex/IDE/HelloWorldPrograms/c/hello.c -o /home/alex/IDE/HelloWorldPrograms/c/hello')
				system( '/home/alex/IDE/HelloWorldPrograms/c/./hello' )
				system( 'git commit -m\"successfull commited\" --a ' )
				send_log_mail(true)
				puts "yes"
			else
				puts "no"
			end
		when 'cpp'
			if system('g++ /home/alex/IDE/HelloWorldPrograms/cpp/hello.cpp -o /home/alex/IDE/HelloWorldPrograms/cpp/hello')
				system( '/home/alex/IDE/HelloWorldPrograms/cpp/./hello' )
				send_log_mail(true)
				puts "yes cpp"
			else
				puts "no CPP"
			end
		when 'java'
			if system('javac /home/alex/IDE/HelloWorldPrograms/java/hello.java')
				system ( 'java -cp /home/alex/IDE/HelloWorldPrograms/java HelloWorld ' )
				send_log_mail(true)
				puts "yes java"
			else
				puts "no JAVA"
			end
		when 'python'
			if system('python /home/alex/IDE/HelloWorldPrograms/python/hello.py')
                                send_log_mail(true)
                                puts "yes python"
                        else
                                puts "no Python"
                        end

		when 'ruby'
			if system('ruby /home/alex/IDE/HelloWorldPrograms/ruby/hello.rb')
                                send_log_mail(true)
                                puts "yes ruby"
                        else
                                puts "no Ruby"
                        end

	end
end

#start script

compile_file()

require "pony"
require "io/console"

puts "Enter email address : (only gmail.com) "

my_mail = gets.chomp

puts "Enter the password from your email #{my_mail} for sending letters:"
password = STDIN.noecho(&:gets).chomp

puts "The recipient of the letter"
send_to = STDIN.gets.chomp

puts "The subject of the email"
theme = STDIN.gets.encode('UTF-8').chomp

puts "The text of the letter"
body = STDIN.gets.encode('UTF-8').chomp

Pony.mail(
{
	:subject => theme,
	:body => body,
	:to => send_to,
	:from => my_mail,

	:via => :smtp,
	:via_options => {
					:address => 'smtp.gmail.com', #это хост, сервер отправки
					:port => '465', #порт
					:tls => true, #если сервер работает в режиме tls
					:user_name => my_mail, #используем наш адресс почты
					:password => password, #задаем введённый в консоль пароль
					:authentication => :plain #обычный тип авторизации
			  }
}

	)

puts "The letter sent successfully!"
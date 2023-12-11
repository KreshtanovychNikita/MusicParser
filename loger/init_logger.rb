require 'mechanize'

browser = Mechanize.new

browser.log = Logger.new("log.log")
browser.log.level = Logger::INFO

browser.get("https://meloua.com/login")
browser.page.forms.first do |form|
  form.field_with(name: 'email').value = Music_parser_tool::Login.email
  form.field_with(name: 'password').value = Music_parser_tool::Login.password
end

browser.page.forms.first.submit
require "rubygems"
require "bundler/setup"
Bundler.require

class WiggleRegLoginPage

  attr_accessor :text_field_login_email, :text_field_register_email, :text_field_register_first_name, :radio_register_option, :text_field_register_password,
                :button_login, :text_field_register_surname, :select_list_register_gender, :button_register, :text_field_login_password, :select_list_register_title, :radio_login_option


  def initialize(browser)
    @browser = browser
    @radio_register_option = @browser.radio(:xpath => "//input[@id = \"RegisterOption\"]")
    @radio_login_option = @browser.radio(:id => "LogInOption")
    @text_field_register_email = @browser.text_field(:id => "RegisterModel_Email")
    @select_list_register_title = @browser.select_list(:id => "RegisterModel_Title")
    @text_field_register_first_name = @browser.text_field(:id => "RegisterModel_FirstName")
    @text_field_register_surname = @browser.text_field(:id => "RegisterModel_Surname")
    @select_list_register_gender = @browser.select_list(:id => "RegisterModel_GenderId")
    @text_field_register_password = @browser.text_field(:id => "RegisterModel_Password")
    @button_register = @browser.button(:name => "RegisterSelector_Register")

    @text_field_login_email = @browser.text_field(:id => "LogOnModel_UserName")
    @text_field_login_password = @browser.text_field(:id => "LogOnModel_Password")
    @button_login = @browser.button(:xpath => "//button[contains(text(), \"Login\")]")
  end

  def register(user)
    @radio_register_option.when_present.set
    @text_field_register_email.set(user.email)
    @select_list_register_title.select(user.title)
    @text_field_register_first_name.set(user.first_name)
    @text_field_register_surname.set(user.surname)
    @select_list_register_gender.select(user.gender)
    @text_field_register_password.set(user.password)
    @button_register.click
  end

  def login(user)
    @text_field_login_email.set(user.email)
    @text_field_login_password.set(user.password)
    @button_login.click
  end
end
Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  #User.new(:email => username, :password => password, :password_confirmation => password).save!

  visit new_user_session_url
  fill_in "user_email", :with => username
  fill_in "user_password", :with => password
  click_button "Sign in"
end

When /^I visit profile for "([^\"]*)"$/ do |username|
  user = User.find_by_username!(username)
  visit user_url(user)
end

Given /^I am not logged in$/ do
  visit destroy_user_session_url
end


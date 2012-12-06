include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def valid_signup
  fill_in "Email",    with: "user123@example.com"
  fill_in "Full Name", with: "Example User"
  fill_in "Password", with: "foobar"
  fill_in "Confirmation", with: "foobar"
  click_button "Create My Account"
end

RSpec::Matchers.define :have_heading_and_title_with_text do |title_text|
  match do |page|
    page.should have_selector('h1', text: title_text)
    page.should have_selector('title', text: title_text)
  end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end
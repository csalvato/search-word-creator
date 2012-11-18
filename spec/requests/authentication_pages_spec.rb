require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_heading_and_title_with_text('Sign in') }
  end

  describe "signin" do
		before { visit signin_path }

    it { should_not have_link('Account') }
    it { should_not have_link('Sign out', href: signout_path) }
    it { should have_link('Sign in', href: signin_path) }
		
		describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_heading_and_title_with_text('Sign in') }
      it { should have_error_message('Invalid') }

			describe "after visiting another page" do
				before {click_link "Contact"}
				it {should_not have_error_message('Invalid')}
			end
    end
		
		describe "with valid information" do
			let( :user ) { FactoryGirl.create(:user) }
			before { valid_signin(user) }

    it { should have_selector('title', text: "Make Custom Word Search Puzzles with Search Word Creator") }
      it { should have_selector('h1', text: "Recently Created Puzzles") }
      it { should have_link('Account', href: edit_user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
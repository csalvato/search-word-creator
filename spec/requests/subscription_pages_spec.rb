require 'spec_helper'

describe "Subscription Pages" do
	subject { page }

  describe "purchase page" do
  	before { visit purchase_path }
		let(:user) { FactoryGirl.create(:user) }

		let(:submit) { "Confirm Purchase" } 

		it { should have_selector 'title', text: "Purchase Search Word Creator" }
		it { should have_selector 'h1', text: "Get Instant Access To Search Word Creator" }
		it { should have_field "card_number" }
		it { should have_field "card_code" }
		it { should have_field "card_month" }
		it { should have_field "card_year" }
		it { should have_button submit}

		describe "when not signed in" do
			it { should have_field "Email" }
			it { should have_field "Full Name" }
			it { should have_field "Password" }
			it { should have_field "Password Confirmation" }
			it { should have_link "Already a member?", href: signin_path }
			
			describe "and fills in the provided sign-up form as new user" do
				before do
					fill_in "Full Name",						 with: "Example User"
					fill_in "Email", 								 with: "user@example.com"
					fill_in "Password", 						 with: "foobar"
					fill_in "Password Confirmation", with: "foobar"
				end

				it "should create the user account on submit" do
					expect { click_button submit }.to change(User, :count).by(1)
				end

				describe "and submits with valid information" do
					before { click_button submit }
	        it { should have_selector('div.alert.alert-success', text: 'Thank you for purchasing!') }
					it { should have_field "Words" } # because its the new puzzle page.
				end

				describe "and submits with invalid information" do
	        before do
						fill_in "Password Confirmation", with: "foobar"
	        	click_button submit
	        end

	        it { should have_selector('div.alert.alert-error') }
					it { should have_field "Words" } # because its the new puzzle page.
				end
			end
		end

		describe "when signed in" do
			before do
				sign_in user
				visit purchase_path
			end

			it { should_not have_field "Email" }
			it { should_not have_field "Full Name" }
			it { should_not have_field "Password" }
			it { should_not have_field "Password Confirmation" }
		end

		describe "with invalid information" do
			pending("Test that it does not make a subscription for the user")
		end

		describe "with valid information" do
			pending("Test that it updates the subscription for the user")
		end
		
  end
end

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

		# INCREDIBLY hard to do because of cookies -- will just do manual testing for now...
		describe "when signed in" do
			pending("Maybe do this one day, when I figure out how to test cookies...")
		end

		describe "when not signed in" do
			it { should have_field "Email" }
			it { should have_field "Full Name" }
			it { should have_field "Password" }
			it { should have_field "Confirmation" }
			
			describe "and fills in the provided sign-up form as new user" do
				let(:some_user){ FactoryGirl.build(:user) }
				before do
					fill_in "Full Name",						 with: some_user.name
					fill_in "Email", 								 with: some_user.email
					fill_in "Password", 						 with: some_user.password
					fill_in "Confirmation", 				 with: some_user.password
					fill_in "card_number",					 with: "4242424242424242"
					fill_in "card_code",						 with: "123"
					select "January", from: "card_month"
					select (Date.today.year+1).to_s, from: "card_year"
				end

				it "should create the user account on submit" do
					expect { click_button submit }.to change(User, :count).by(1)
				end

				describe "and submits with valid information", js: true do
					before do
					 click_button submit
					 sleep 5
					end
	        it { should have_selector('div.alert.alert-success', text: 'Thank you for purchasing!') }
					it { should have_field "Words" } # because its the new puzzle page.
			    it { should_not have_link "Buy Now!", href: plans_path }

					describe "and then tries to revisit the purchase page", js: true do
						before do
							visit purchase_path
						end

						# Should redirect to account screen with an alert
						# These tests pass when I do them myself but don't know why they are failing here
						specify { User.find_by_email(some_user.email).subscription.paid_user?.should be_true }
						it { should have_selector( 'title', text: "Account") }
						it { should_not have_field "card_number" }
			      it { should have_selector('div.alert.alert-notify') }
			      it { should_not have_link "Buy Now!", href: plans_path }
					end

				end

				describe "and submits with invalid information" do
	        before do
						fill_in "Confirmation", with: "lol-this-isn't-right"
	        	click_button submit
	        end

	        it { should have_selector('div.alert.alert-error') }
				end
			end

			describe "and fills in the provided sign-up form as existing user" do
				before do
					fill_in "Full Name",						 with: "New Name"
					fill_in "Email", 								 with: user.email
					fill_in "Password", 						 with: user.password
					fill_in "Confirmation", 				 with: user.password
				end

				it "should not create a new user account on submit" do
					expect { click_button submit }.to_not change(User, :count).by(1)
				end

				describe "and submits with existing user's information" do
					before { click_button submit }
					specify { user.name.should_not == "New Name" }
	        it { should have_selector('div.alert.alert-error') }
					it { should_not have_field "Words" } # because its the not the new puzzle page.
				end

				describe "and submits with invalid information" do
	        before do
						fill_in "Password", with: "incorrect-password"
	        	click_button submit
	        end

	        it { should have_selector('div.alert.alert-error') }
					it { should_not have_field "Words" } # because its the new puzzle page.
				end
			end
		end
  end
end

require 'spec_helper'

describe "UserPages" do
	subject { page }
	
	describe "signup" do
		before { visit signup_path }	

		let(:submit) { "Create my account" }
		let(:title_text){ 'Sign up' }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
			
			describe "after submission" do
				before { click_button submit }
        
        it { should have_selector 'title', text: title_text }
        it { should have_content 'error' }

        let(:error_messages) { page.find 'div#error_explanation ul' }
        specify { error_messages.should_not have_content "Password digest can't be blank" }
     
        specify { error_messages.should have_content "Name can't be blank" }
        specify { error_messages.should have_content "Password can't be blank" }
        specify { error_messages.should have_content "Email can't be blank" }
        specify { error_messages.should have_content "Email is invalid" }
        specify { error_messages.should have_content "Password is too short (minimum is 6 characters)" }
        specify { error_messages.should have_content "Password confirmation can't be blank" }

      end
		end
		
		describe "with valid information" do
			before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after submission" do
        before { click_button submit }
        
        it { should_not have_selector 'title', text: title_text }
        it { should_not have_content 'error' }

        specify { should_not have_content "Name can't be blank" }
        specify { should_not have_content "Email can't be blank" }
        specify { should_not have_content "Email is invalid" }
        specify { should_not have_content "Password can't be blank" }
        specify { should_not have_content "Password is too short (minimum is 6 characters)" }
        specify { should_not have_content "Password confirmation can't be blank" }

      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link 'Sign out' }
        
        describe "followed by signout" do
          before { click_link 'Sign out' }
          it { should have_link('Sign in') }
        end
      end
		end
	end

  describe "dashboard" do
    before { visit signup_path }  

    #it { should have_link('Create Your Own Puzzle', href: new_word_search_puzzle_path) }
    # "should have 'use one of our puzzles' link" #later
    # "should have create word lists link" #later
    # "when user has no recent puzzles" #later
    # "when user has recent puzzles" #later
  end

end

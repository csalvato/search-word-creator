require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h5', text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "signin" do
		before { visit signin_path }

    it { should_not have_link('Account') }
    it { should_not have_link('Sign out', href: signout_path) }
    it { should have_link('Sign in', href: signin_path) }
		
		describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('h5', text: 'Sign in') }
      it { should have_selector('title', text: 'Sign in') }
      it { should have_error_message('Invalid') }

			describe "after visiting another page" do
				before {click_link "Contact"}
				it {should_not have_error_message('Invalid')}
			end
    end
		
		describe "with valid information" do
			let( :user ) { FactoryGirl.create(:user) }
			before { valid_signin(user) }

      it { should have_selector('title', text: "Create custom search word puzzles with Search Word Creator") }
      it { should have_link('Account', href: edit_user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }
    end
  end

  describe "for non-signed-in users" do
    let(:user) { FactoryGirl.create(:user) }
    let(:word_search_puzzle) { FactoryGirl.create(:word_search_puzzle) }

    describe "in the Users controller" do
      describe "visiting the edit (Account) page" do
        before { visit edit_user_path(user) }
        it { should have_selector('title', text: 'Sign up') }
      end

      describe "submitting to the update action" do
        before { put user_path(user) }
        specify { response.should redirect_to(signup_path) }
      end

      describe "when attempting to visit a protected page that, when logged in, one SHOULD have access to" do
        before do
          visit edit_user_path(user)
          click_link "Sign in here."
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Account')
          end

          describe "signin path visits" do
            before { visit signin_path }
            it "should redirect to the dashboard" do
              page.should have_field("Name")
            end
          end

          describe "should clear the cached desired protected page" do
            before do 
              click_link "Sign out"
              visit edit_user_path(user)
              sign_in user
            end

            it "should render the Account page" do
              page.should have_selector('title', text: 'Account')
            end

            describe "visiting the new page" do
              before { visit new_user_path }
              it { should_not have_selector('title', text: 'Sign up') }
              it { should_not have_link("Start Making Puzzles", href: signup_path) }
            end

            describe "submitting a PUT request to the Users#create action" do
              before { post users_path }
              specify { response.should redirect_to(dashboard_path) }
            end
          end
        end
      end

     describe "when attempting to visit a protected page that, when logged in, one should NEVER have access to" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          visit edit_user_path(other_user)
          click_link "Sign in here."
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do
          it "should render the default entry screen (e.g new word search screen) (not the protected page)" do
            page.should have_field("Name")
          end
        end


      end
    end

    describe "in the WordSearchPuzzles controller" do
      describe "visiting the new Word Search Puzzle page and trying to print puzzles" do
        before do
          visit new_word_search_puzzle_path
        end 

        it { should have_link "Sign in here." }
      end
      
      describe "submitting to the update action" do
        before { post print_path }
        specify { response.should redirect_to(signup_path) }
      end
    end
  end
end
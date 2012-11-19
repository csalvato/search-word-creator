require 'spec_helper'

describe "WordSearchPuzzlePagesSpecs" do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }
  subject { page }

  shared_examples_for "all pages" do

    it { should have_selector( "body.#{page_type}") }
    it { should have_selector( 'title' , content: " | Search Word Creator") }
    

    describe "should have core links" do
      it { should have_link("FAQ", href: faq_path) }
			it { should have_link("Contact", href: contact_path) }
			it { should have_link("Sign out", href: signout_path) }
			it { should_not have_link("Sign in", href: signin_path) }
    end

		describe "should have title link" do
			it { should have_link("Search Word Creator", href: root_path) }
		end
	end

	describe "Create New Puzzle Page" do
		before { visit new_word_search_puzzle_path }
		let(:page_type) { 'page' }

		it_should_behave_like "all pages"
		it { should have_field("Name") }
		it { should have_field("Words") }
		it { should have_button("Next Step") }

		describe "after clicking on Next Step with one valid word" do
			before do
				fill_in "Name", with: "Puzzle Test"
				fill_in "Words", with: "foobar"
				click_button "Next Step"
			end
			
			specify { current_path.should == word_search_puzzles_path }
			it { should have_field("Total Number of Puzzles")}
			it { should have_selector('h1', "Words You've Added")}
			it { should have_content('foobar') }
			it { should have_button('Print Puzzles') }
		end
	end

	describe "Puzzle Options Page" do
		before { visit puzzle_options_path }
		let(:page_type) { 'page' }

		it_should_behave_like "all pages"
		it { should have_button("Print Puzzles") }
	end

	describe "Print Puzzles Page" do
		before { visit print_puzzles_path }
		let(:page_type) { 'page' }

		it_should_behave_like "all pages"
		it { should have_selector('h1', text: "Ready to download!") }
	end

end

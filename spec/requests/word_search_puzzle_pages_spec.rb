require 'spec_helper'

describe "WordSearchPuzzlePagesSpecs" do
  let(:user) { FactoryGirl.create(:user) }
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

	shared_examples_for "Step 1 Page" do
		it_should_behave_like "all pages"
		it { should have_field("Name") }
		it { should have_field("Words") }
		it { should have_button("Next Step") }
		it { should have_content('Step 1 of 3') }
	end

	shared_examples_for "Step 2 Page" do
		it_should_behave_like "all pages"
		it { should have_selector('h1', text: "Words You've Added")}
		it { should have_field("num_puzzles") }
		it { should have_button("Print Puzzles") }
		it { should have_content('Step 2 of 3') }
	end

	shared_examples_for "Step 3 Page" do
		it_should_behave_like "all pages"
		specify { current_path.should == print_path }
		it { should have_selector('h1', text: 'Ready to download!') }
		it { should have_content('Step 3 of 3') }
	end

	describe "Step 1 Page" do
		before do
		 sign_in user
		end
		before { visit new_word_search_puzzle_path }
		let(:page_type) { 'page' }

		it_should_behave_like "all pages"
		it_should_behave_like "Step 1 Page"

		describe "after clicking on Next Step with no words text area" do
			before do
				fill_in "Name", with: "Puzzle Test"
				click_button "Next Step"
			end
			
			it_should_behave_like "Step 1 Page"
			specify { current_path.should == word_search_puzzles_path }
			it { should have_selector('div.alert.alert-error')}
		end

		describe "after clicking on Next Step with one valid word" do
			before do
				fill_in "Name", with: "Puzzle Test"
				fill_in "Words", with: "foobar"
				click_button "Next Step"
			end
			
			it_should_behave_like "all pages"
			it_should_behave_like "Step 2 Page"
			specify { current_path.should == word_search_puzzles_path }
			it { should have_content('FOOBAR') }
		end

		describe "after clicking on Next Step with a word that is too long" do
			before do
				fill_in "Name", with: "Puzzle Test"
				fill_in "Words", with: "foobar\r\nthiswordistoolongthiswordistoolong"
				click_button "Next Step"
			end
			
			specify { current_path.should == word_search_puzzles_path }
			it { should have_content('FOOBAR') }
			it { should_not have_content('["FOOBAR", "THISWORDISTOOLONGTHISWORDISTOOLONG"]') }
		end

		describe "after clicking on Next Step with a two valid words and a blank word in the text area" do
			before do
				fill_in "Name", with: "Puzzle Test"
				fill_in "Words", with: "foobar\r\n\r\nfoobaz"
				click_button "Next Step"
			end

			it_should_behave_like "all pages"
			it_should_behave_like "Step 2 Page"
			specify { current_path.should == word_search_puzzles_path }
			it{ should have_content("FOOBAR") }
			it{ should have_content("FOOBAZ") }

			describe "and then clicking print puzzles" do
				before do
					click_button "Print Puzzles"
				end
				it_should_behave_like "all pages"
				it_should_behave_like "Step 3 Page"
			end

			describe "and then clicking print puzzles with 15 puzzles" do
				before do
					fill_in "num_puzzles", with: "15"
					click_button "Print Puzzles"
				end
				
				describe "and then going back to create more puzzles" do
					before { visit new_word_search_puzzle_path }

					it { should have_content('Your trial has expired') }
					it { should_not have_field('Words') }
				end
			end
		end
	end

	describe "Landing Pages" do
		let(:page_type) { 'page' }
		describe "when not signed in" do
			before do
				visit word_search_puzzles_path 
			end
						
			it { should have_link "Holiday" }

			describe "after clicking on category link" do
				before { click_link "Holiday" }

				it { should have_link "Christmas" }
				it { should have_selector("h1", content: "Holiday Search Word Puzzles")}

				describe "after clicking on individual puzzle link" do
					before { click_link "Christmas" }

					it { should have_selector("h1", content: "Christmas Search Word Puzzle")}
					it { should have_link("Print Puzzles") }
				
					describe "after clicking on Print Puzzles link" do
						before do 
							click_link "Print Puzzles"
						end

						it { should have_selector("h5", content:"Sign in") }

						describe "and then signing in" do
							before do
								valid_signin(user)							
							end

							it_should_behave_like "Step 1 Page"
							it { should have_content("CHIMNEY") }

							describe "and moving to the next step" do
								before { click_button "Next Step" }

								it_should_behave_like "Step 2 Page"
							end
						end

						describe "and then signing up" do
							before do
								click_link "Sign up now!"
								valid_signup
							end

							it_should_behave_like "Step 1 Page"
							it { should have_content("CHIMNEY") }
						end
					end
				end
			end
		end
		describe "when signed in" do
			before do
				sign_in user
				visit word_search_puzzles_path 
			end
			it_should_behave_like "all pages"
			
			it { should have_link "Holiday" }

			describe "after clicking on category link" do
				before { click_link "Holiday" }

				it { should have_link "Christmas" }
				it { should have_selector("h1", content: "Holiday Search Word Puzzles")}

				describe "after clicking on individual puzzle link" do
					before { click_link "Christmas" }

					it { should have_selector("h1", content: "Christmas Search Word Puzzle")}
					it { should have_link("Print Puzzles") }
				
					describe "after clicking on Print Puzzles link" do
						before do 
							click_link "Print Puzzles"
						end
						
						it_should_behave_like "Step 1 Page"
						it { should have_content("CHIMNEY") }

						describe "and moving to the next step" do
							before { click_button "Next Step" }

							it_should_behave_like "Step 2 Page"
						end
					end
				end
			end
		end
	end
end

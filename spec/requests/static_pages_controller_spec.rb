require 'spec_helper'

describe "StaticPages" do
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector( "body.#{page_type}") }
    it { should have_selector( 'title', text: 'Create your own custom search word puzzles | Search Word Creator') }


    describe "should have core links" do
      it { should have_link("FAQ", href: faq_path) }
			it { should have_link("Contact", href: contact_path) }
			it { should have_link("Sign in", href: signin_path) }
      it { should have_link("Buy Now!", href: plans_path) }
    end

		describe "should have title link" do
			it { should have_link("Search Word Creator", href: root_path) }
		end

  end

  describe "Home page" do
    before { visit root_path }
    let(:page_type)    { 'home' }

    it_should_behave_like "all static pages"
    it { should have_link("Start Making Puzzles", signup_path) }
    it { should have_link("Make Puzzles Now!", signup_path) }
    it { should_not have_selector("div.header div.grid.col5") }
  end

  describe "Contact page" do
    before { visit contact_path }
		let(:page_type)    { 'page' }

    it_should_behave_like "all static pages"
    it { should have_button("Send Message") }
    it { should have_link("email", href:"mailto:support@searchwordcreator.com") }
    it { should_not have_selector("div.header div.grid.col5") }
    it { should have_selector('form', action: sendemail_path)}
  end

	describe "FAQ page" do
    before { visit faq_path }
		let(:page_type)    { 'page' }

    it_should_behave_like "all static pages"
    it { should have_content("Q: ") }
    it { should have_content("A: ") }
    it { should_not have_selector("div.header div.grid.col5") }
  end

  describe "Plans page" do
    before { visit plans_path }
		let(:page_type)    { 'page.plans' }

    it_should_behave_like "all static pages"
    it { should have_link("Get Started", href: purchase_path) }
    it { should have_link("Get Started", href: signup_path) }
    it { should have_selector("div.header div.grid.col3") }

  end

end

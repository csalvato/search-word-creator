require 'spec_helper'

describe "Subscription Pages" do
	subject { page }

  describe "purchase page" do
  	before { visit purchase_path }

		let(:submit) { "Confirm Purchase" } 

		it { should have_selector 'title', text: "Purchase Search Word Creator" }
		it { should have_selector 'h1', text: "Get Instant Access To Search Word Creator" }
		it { should have_button submit}

		describe "with invalid information" do
			pending("Test that it does not make a subscription for the user")
		end

		describe "with valid information" do
			pending("Test that it updates the subscription for the user")
		end
		
  end
end

require 'spec_helper'

describe "Static pages" do

  	shared_examples_for "all static pages" do
    	it { should have_selector('h1', text: heading) }
    	it { should have_title(full_title(page_title)) }
  	end

	subject {page}

  	describe "Home page" do
    	before { visit root_path }
    	let(:heading)    { 'Sample App' }
    	let(:page_title) { '' }
    	it_should_behave_like "all static pages"
    	it { should_not have_title('| Home') }
  	end	
  	describe "Help page" do
    	before { visit root_path }
    	let(:heading)    { 'Help' }
    	let(:page_title) { 'Help' }
  	end
  	describe "About page" do
    	before { visit root_path }
    	let(:heading)    { 'About Us' }
    	let(:page_title) { 'About Us' }
  	end

  	describe "Contact page" do
    	before { visit contact_path }
    	it { should have_selector('h1', text: 'Contact Us') }
    	it { should have_title(full_title('Contact Us')) }
  	end
end
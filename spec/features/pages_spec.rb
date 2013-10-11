require 'spec_helper'

describe "Pages" do

  describe "Home page" do
    it "contains the correct title" do
      visit '/pages/home'
      expect(page).to have_content("Infrastructure Development and Support Group")
    end
  end

  describe "Authentication" do
    it "has appropriate content" do
      visit '/pages/auth'
      page.should have_css 'div', :text => 'Login'
      page.should have_css 'div', :text => 'Password'
    end
  end

  describe "Data Storage" do
    it "contains correct features" do
      visit '/pages/storage'
      page.should have_css 'div', :text => 'Space'
    end
  end

  describe "Devices" do
    it "contains correct features" do
      visit '/pages/devices'
      page.should have_css 'div', :text => 'Register'
      page.should have_css 'div', :text => 'Manage'
    end
  end

  describe "Downloads" do
    it "contains correct features" do
      visit '/pages/devices'
      page.should have_css 'div', :text => 'Software'
    end
  end

  describe "Feedback" do
    it "contains correct features" do
      visit '/pages/feedback'
      page.should have_css 'div', :text => 'Feedback'
      page.should have_css 'button', :text => 'Submit'
    end
  end

  describe "RT tickets and Job Requests" do
    it "contains correct features" do
      visit '/pages/tickets'
      page.should have_css 'div', :text => 'Request'
      page.should have_css 'button', :text => 'Submit'
    end
  end

  describe "FAQ" do
    it "contains correct features" do
      visit '/pages/faq'
      page.should have_css 'div', :text => 'FAQ'
      page.should have_css 'p', :text => 'Q:'
      page.should have_css 'p', :text => 'A:'
    end
  end
end

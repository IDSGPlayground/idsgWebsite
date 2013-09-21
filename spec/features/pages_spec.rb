require 'spec_helper'

describe "Pages" do

  describe "Home page" do
    it "works! (now write some real specs)" do
      visit '/pages/home'
      expect(page).to have_content("IDSG")
    end
  end
end

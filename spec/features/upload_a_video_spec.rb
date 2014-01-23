require 'spec_helper'

feature "Upload a Video" do

  scenario "/ should include the application name in its title" do
    visit root_path

    expect(page).to have_title "Mobile Video Upload"
  end

end
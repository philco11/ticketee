require 'spec_helper'

feature "hidden links" do
  let(:user)    { Factory(:confirmed_user) }
  let(:admin)   { Factory(:admin_user) }
  let(:project) { Factory(:project) }

  context "anonymous users" do
    scenario "cannot see the New Project link" do
      visit '/'
      # assert_no_link_for "New Project"
      page.should_not have_link("New Project")
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      page.should_not have_link("Edit Project")
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      page.should_not have_link("Delete Project")
    end
  end

  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Project link" do
      visit '/'
      # assert_no_link_for "New Project"
      page.should_not have_link("New Project")
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      page.should_not have_link("Edit Project")
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      page.should_not have_link("Delete Project")
    end
  end

  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the New Project link" do
      visit '/'
      # assert_link_for "New Project"
      page.should have_link("New Project")
    end

    scenario "can see the Edit Project link" do
      visit project_path(project)
      page.should have_link("Edit Project")
    end

    scenario "can see the Delete Project link" do
      visit project_path(project)
      page.should have_link("Delete Project")
    end
  end
end
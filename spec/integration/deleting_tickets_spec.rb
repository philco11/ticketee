require 'spec_helper'
feature 'Deleting tickets' do
  let!(:project) { Factory(:project) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:ticket) do
    ticket = Factory(:ticket, :project => product)
    ticket.update_attribute(:user, user)
    ticket
  before do
      sign_in_as!(user)
    visit '/'
    click_link project.name
    click_link ticket.title
  end
  
  scenario "Deleting a ticket" do
    click_link "Delete ticket"
    page.should have_content("Ticket has been deleted.")
    page.current_url.should == project_url(project)
  end
end
end

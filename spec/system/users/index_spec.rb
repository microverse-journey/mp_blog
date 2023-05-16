require 'rails_helper'

RSpec.describe 'Users', type: :system do
    before :each do
        visit users_path
    end

  describe 'index page' do
    it 'shows the username of all other users' do
      expect(page).to have_selector('.user-card', count: User.count)
    end

    # it 'shows the profile picture for each user.' do
    #     visit users_path
    #     expect(page).to have_content('Hello, world!')
    # end

    # it 'shows the number of posts each user has written' do
    # end
  end

#   describe 'events' do
#     context "When I click on a user, I am redirected to that user's show page"
#         it "should redirects to the user's show page" do
#             click_link 'Sign in'
#         end
#     end
#   end
end

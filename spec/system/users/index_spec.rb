require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before :each do
    @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer', posts_counter: 0)
    @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, comments_counter: 0, likes_counter: 0)
  end

  describe 'index page' do
    it 'shows the username of all other users' do
      visit users_path
      expect(page).to have_content(@user.name)
      expect(page).to have_selector(".user-card", count: User.count)
    end

    it 'shows the profile picture for each user.' do
        visit users_path
        expect(page).to have_selector('.user-card img', count: User.count)
    end

    it 'shows the number of posts each user has written' do
      visit users_path
      expect(page).to have_text(@user.posts_counter)
      expect(page).to have_selector('.post_number', count: User.count)
    end
  end

  describe 'Click events' do
    context "When I click on a user, I am redirected to that user's show page" do
      it "should redirects to the user's show page" do
        visit users_path
        click_link @user.name
        sleep(3)
        expect(page.current_path).to eq(user_path(@user.id))
      end
    end
  end
end

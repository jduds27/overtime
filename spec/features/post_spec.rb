require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    # it 'has a title of Posts' do
    #   visit posts_path
    #   expect(page).to have_content(/Posts/)
    # end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "jason1", password_confirmation:      "jason1", first_name: "jon", last_name: "snow")
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'has a new form that can be reched' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some Rationale"
      click_on "save"

      expect(page).to have_content("Some Rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end
end

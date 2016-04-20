require 'rails_helper'

RSpec.describe 'New list creation', :type => :feature do
  let(:user_a) { {email: 'user_a@example.com', password: '76$V-+$f:Hhd3zYubs@i'} }
  let(:user_b) { {email: 'user_b@example.com', password: 'HGlp+@0z9SIjXr;F,jUz'} }


  def sign_in(email, password)
    visit '/'
    click_link 'Manage Passwords'

    if page.body.match(/Create a new password/).blank?
      fill_in 'sign_in_email', with: email
      fill_in 'sign_in_password', with: password
      click_button 'Sign In'
    end

    expect(page).to have_link('Create a new password')
  end

  def create_new_password(subject)
    click_link 'Create a new password'
    fill_in 'password_subject', with: subject
    click_button 'Create'

    click_link 'Back to Passwords'
    expect(page).to have_link(subject)
  end


  it 'lets users login and create passwords only visible to them' do
    DoorMat::TestHelper::create_signed_up_actor_with_confirmed_email_address(user_a[:email], user_a[:password])
    DoorMat::TestHelper::create_signed_up_actor_with_confirmed_email_address(user_b[:email], user_b[:password])

    sign_in(user_a[:email], user_a[:password])
    create_new_password('User A password')
    click_link 'Sign Out'

    sign_in(user_b[:email], user_b[:password])
    create_new_password('User B password')
    expect(page).not_to have_link('User A password')
    click_link 'Sign Out'

    sign_in(user_a[:email], user_a[:password])
    expect(page).to have_link('User A password')
    expect(page).not_to have_link('User B password')
    click_link 'Sign Out'
  end

end

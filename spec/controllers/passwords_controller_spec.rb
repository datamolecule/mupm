require 'rails_helper'

RSpec.describe PasswordsController do
  let(:user) { {email: 'user@example.com', password: '76$V-+$f:Hhd3zYubs@i'} }

  render_views

  it 'shows existing passwords' do
    actor, _ = DoorMat::TestHelper::create_signed_in_actor_with_confirmed_email_address(user[:email], user[:password])

    p = Password.new_w_default
    p.subject = 'secret'
    p.actor = actor
    p.generate
    p.save

    get :show, {id: 1}

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to match(/secret/)
  end

  it 'redirects to the password index if the requested password is not found' do
    _, _ = DoorMat::TestHelper::create_signed_in_actor_with_confirmed_email_address(user[:email], user[:password])
    allow(Password).to receive(:find).and_raise(ActiveRecord::RecordNotFound)

    get :show, {id: 1}

    expect(response).to have_http_status(302)
    expect(response).to redirect_to '/passwords'
  end
end

require 'rails_helper'

RSpec.describe PasswordsController do
  render_views

  it 'shows existing passwords' do
    p = Password.new
    p.subject = 'secret'
    allow(Password).to receive(:find).and_return(p)

    get :show, {id: 1}

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to match(/secret/)
  end

  it 'redirects to the password index if the requested password is not found' do
    allow(Password).to receive(:find).and_raise(ActiveRecord::RecordNotFound)

    get :show, {id: 1}

    expect(response).to have_http_status(302)
    expect(response).to redirect_to '/passwords'
  end
end

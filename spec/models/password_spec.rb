require 'rails_helper'

RSpec.describe Password do

  it 'generates random passwords of the desired length' do
    p1 = Password.new_w_default
    p2 = Password.new_w_default

    expect(p1.generate).not_to eq(p2.generate)
    expect(p1.length).to eq(p1.password.length)
  end

end
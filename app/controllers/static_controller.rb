class StaticController < ApplicationController
  skip_before_action :require_valid_session, only: [:about, :home]
  skip_before_action :require_confirmed_email, only: [:about, :home]

  # A valid session is not required in the static pages but if present
  # the application layout will display the user email address and
  # Sign Out button.
  before_action -> { DoorMat::Session.from(cookies, request) }
end

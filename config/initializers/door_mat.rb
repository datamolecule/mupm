
# Associate passwords with actors
Rails.application.config.to_prepare do
  DoorMat::Actor.class_eval do
    has_many :passwords, :dependent => :destroy

  end
end

# Override DoorMat lib/door_mat/configuration.rb defaults
DoorMat.configure do |config|
  config.sign_in_success_url = [:main_app, :passwords_url]
  config.sign_up_success_url = [:main_app, :passwords_url]
  config.confirm_email_success_url = [:main_app, :passwords_url]
  config.sign_out_success_url = [:main_app, :root_url]

  config.mailer_from_address = Rails.application.secrets.mailer_address

  config.logger = Rails.logger
end

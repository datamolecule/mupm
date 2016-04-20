class PasswordsController < ApplicationController

  def index
    @actor = DoorMat::Session.current_session.actor
    @passwords = @actor.passwords.order(:subject, :created_at)
  end

  def show
    @password = DoorMat::Session.current_session.actor.passwords.find(params[:id].to_i)
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Record not found - The password you requested could not be found'
    redirect_to passwords_url
  end

  def new
    @password = Password.new_w_default
  end

  # no edit

  def create
    @password = DoorMat::Session.current_session.actor.passwords.build(password_params)
    if @password.valid? && @password.generate && @password.save
      flash[:notice] = 'New password created'
      redirect_to password_path(@password)
    else
      render :new
    end
  end

  # no update

  def destroy
    @password = DoorMat::Session.current_session.actor.passwords.find(params[:id].to_i)
    @password.destroy
    flash[:notice] = 'Password was deleted'

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Record not found - The password you requested could not be found'
  ensure
    redirect_to passwords_url
  end

  private
  def password_params
    params.require(:password).permit(:subject, :length, :capital, :numeric, :special)
  end

end

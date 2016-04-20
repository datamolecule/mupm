class PasswordsController < ApplicationController

  def index
    @passwords = Password.order(:subject, :created_at)
  end

  def show
    @password = Password.find(params[:id].to_i)
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Record not found - The password you requested could not be found'
    redirect_to passwords_url
  end

  def new
    @password = Password.new_w_default
  end

  # no edit

  def create
    @password = Password.new(password_params)
    if @password.valid? && @password.generate && @password.save
      flash[:notice] = 'New password created'
      redirect_to password_path(@password)
    else
      render :new
    end
  end

  # no update

  def destroy
    @password = Password.find(params[:id].to_i)
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

class UsersController < ApplicationController
  before_filter :user_in_wedding_party # For all actions, this controller isn't exactly safe

  def index
    @users = User.all
  end

  def update
    @user = User.find params[:id]

    respond_to do |type|
      if @user.update_attributes(user_params)
        flash[:notice] = 'User was successfully updated.'
        type.html { redirect_to(users_path) }
        type.xml  { head :ok }
      else
        flash.now[:errors] = @user.errors.full_messages
        type.html { redirect_to(users_path) }
        type.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  def user_in_wedding_party
    redirect_to new_user_session_path unless current_user.present?
    redirect_to exhibits_path if current_user.present? && !current_user.in_wedding_party?
  end

  def user_params
    params.require(:user).permit(:access_level)
  end
end

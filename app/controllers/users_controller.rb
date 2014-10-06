class UsersController < ApplicationController

	def create
		@user = User.new user_params
		
		if @user.save
            flash[:notice] = "Your account has been created! Please login."
            redirect_to root_path
        else
            # Re-render the template that led here. Errors will be displayed
            # because there is a @user instance variable now.
            render "welcome/index"
        end

	end

	private

	def user_params
		params.require(:user).permit( 
			:password,
			:password_confirmation,
			:email,
			:mobile
			)
	end
end

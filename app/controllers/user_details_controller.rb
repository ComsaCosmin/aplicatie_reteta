class UserDetailsController < ApplicationController

	def index
		@user_detail = UserDetail.find params[:id]
	end
	def create
		@user_detail = UserDetail.new user_detail_params
		if @user_detail.save
	      redirect_to root_path
	    else
	      # This line overrides the default rendering behavior, which
	      # would have been to render the "create" view.
	      render "new"
	    end
	end

	private

		def user_detail_params
		    params.require(:user_detail).permit(:first_name, :last_name, :age, :description, :user_id)
		end
end
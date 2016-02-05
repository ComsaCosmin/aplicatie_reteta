class Admin::HomesController < ApplicationController
	before_filter :have_permission?
	def index
		@users = User.all
		@recipes = Recipe.all
	end

	private

	def have_permission?
		unless current_user.is_admin?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
	end
end
class Admin::RecipesController < ApplicationController
	def index
		@recipes = Recipe.all

	end

	def show
		@recipe = Recipe.find params[:id]
	end

	def new
		@recipe = Recipe.new
	end

	def edit
	  @recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
	    @recipe.update!(recipe_params)
	    redirect_to @recipe
	end

	def create
		@recipe = Recipe.new recipe_params
		if @recipe.save
	      redirect_to admin_recipe_path(@recipe)
	      flash[:success] = "Reteta creata cu succes!"
	    else
	      # This line overrides the default rendering behavior, which
	      # would have been to render the "create" view.
	      redirect_to new_admin_recipe_path
	      flash[:error] = "Completeaza toate campurile!"
	    end
	end

	def destroy
		Recipe.find(params[:id]).destroy
     	redirect_to admin_recipes_path
	end

	private

		def recipe_params
		    params.require(:recipe).permit(:title, :ingredient, :direction, :type, :specific, :difficulty, :description, :user_id, :image)
		end
end
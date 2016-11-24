class RecipesController < ApplicationController
  def index
    sort_attribute = params[:sort]
    # @recipes = Recipe.order(sort_attribute)
    if current_user
      @recipes = current_user.recipes
    else
      @recipes = []
    end
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    recipe = Recipe.new(
      title: params["title"],
      chef: params["chef"],
      ingredients: params["ingredients"],
      directions: params["directions"]
    )
    recipe.save
    redirect_to "/recipes/#{recipe.id}"
  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render 'show.html.erb'
  end

  def edit
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render 'edit.html.erb'
  end

  def update
    recipe_id = params[:id]
    recipe = Recipe.find_by(id: recipe_id)
    recipe.title = params[:title]
    recipe.chef = params[:chef]
    recipe.ingredients = params[:ingredients]
    recipe.directions = params[:directions]
    recipe.save
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe_id = params[:id]
    recipe = Recipe.find_by(id: recipe_id)
    recipe.destroy
    redirect_to "/recipes"
  end
end
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/new' do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/:name" do
    @recipe = Recipe.find_by(params[:name])
    erb :show
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.clear
  end

end

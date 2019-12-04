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

  get "/recipes/:name" do
    @recipe = Recipe.find_by(params[:name])
    erb :show
  end

end

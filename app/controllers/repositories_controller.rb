class RepositoriesController < ApplicationController
  def index
     response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:LKR3GW3UGSWLR5D15Y5KI52GWRMC3RIV2XTY1HLPJMVNGVUJ]}", 'Accept' => 'application/json'}
     @repos_array = JSON.parse(response.body)
   end

   def create
     response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
     redirect_to '/'
   end
end

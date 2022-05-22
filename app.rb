# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require 'cat_ad_list'
require 'user_list'
require 'user'

class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader
  end

  before do
    # This sets up the global data store. You will use this for your data model.
    # In future you will use a database instead.
    $global ||= {}
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE
  enable :sessions

  def user_list
    $global[:user_list] ||= UserList.new
  end

  def get_all_ads
    user_list.list.map {|user| user.cat_ads.list}
  end

  get '/' do
    erb :catboard_index, locals: { cat_list: get_all_ads }
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(
      name: params["name"], 
      email: params["email"], 
      mobile: params["mobile"],
      password: params["password"]
    )
    user_list.add(@user)
    session[:user_id] = @user.id
    redirect '/users/profile'
  end

  get '/users/profile' do
    @user = user_list.find(session[:user_id])
    erb :'/users/profile'
  end

  # get '/new' do
  #   erb :lostcats_new
  # end

  # post '/' do
  #   cat_list.add(
  #     params[:name], 
  #     params[:description], 
  #     params[:mobile], 
  #     params[:password]
  #   )
  #   redirect '/'
  # end

  # delete '/:id' do
  #   cat_list.remove(params[:id].to_i)
  #   redirect '/'
  # end

  # get '/:id' do
  #   erb :lost_cats_details, locals: { 
  #     lost_cat: cat_list.get(params[:id].to_i), 
  #     index: params[:id].to_i 
  #   }
  # end

  # get '/:id/edit' do
  #   lost_cat_id = params[:id].to_i
  #   erb :lost_cats_edit, locals: {
  #     id: lost_cat_id,
  #     lost_cat: cat_list.get(lost_cat_id)
  #   }
  # end

  # patch '/:id' do
  #   lost_cat_id = params[:id].to_i
  #   cat_list.update(
  #     lost_cat_id, 
  #     params[:name] ||= nil,
  #     params[:description] ||= nil,
  #     params[:mobile] ||= nil,
  #     params[:sighting] ||= nil,
  #     params[:password] ||= nil
  #   )
  #   redirect "/#{lost_cat_id}"
  # end

  # get '/:id/sighting' do
  #   lost_cat_id = params[:id].to_i
  #   erb :lost_cats_sighting_edit, locals: {
  #     id: lost_cat_id,
  #     lost_cat: cat_list.get(lost_cat_id)
  #   }
  # end

end

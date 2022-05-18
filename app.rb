# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "cat_list"

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

  def cat_list
    $global[:cat_list] ||= CatList.new
  end

  get '/lostcats' do
    erb :lost_cats_index, locals: { cat_list: cat_list.list }
  end

  get '/lostcats/new' do
    erb :lostcats_new
  end

  post '/lostcats' do
    cat_list.add(params[:name], params[:about])
    redirect '/lostcats'
  end

  delete '/lostcats/:id' do
    cat_list.remove(params[:id].to_i)
    redirect '/lostcats'
  end



end

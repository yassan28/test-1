require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :index
end

require 'sinatra'
require 'sinatra/reloader'
require 'maxminddb'
require 'erubis'
set :erb, :escape_html => true

db = MaxMindDB.new('./GeoLite2-City.mmdb')

get '/' do
    erb :index
end
post '/' do
    host = params['host']
    @ip = IPSocket::getaddress(host)
    @geo = db.lookup(@ip)
    erb :index
end

require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'sinatra-authentication'
require 'json'

use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET'] || 'This is a secret key that no one will guess~'

class Item
  include DataMapper::Resource
  property :id, Serial
  property :description, String
  property :color, String, :length => 20

  belongs_to :dm_user
end

class DmUser
  has n, :items
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/test.db")
DataMapper.auto_upgrade!

get '/' do
  haml :index
end

get '/board' do
  haml :board, :layout => false
end

post '/items' do
  current_user.items.create(params)
  "ok"
end

get '/items' do
  current_user.items.map {|item| item.attributes}.to_json
end

def name
  current_user.email.split("@")[0]
end

__END__

@@ layout
!!! XML
!!!
%html
  %head
    %title Kwerk
    %link{:rel => 'stylesheet', :type => 'text/css', :href => '/base.css'}
    %script{:type => 'text/javascript', :src => '/add_items.js'}
    %script{:type => 'text/javascript', :src => '/mootools.js'}
  %body
    #top_bar
      %ul#account_links
        - if logged_in?
          %li Welcome #{name}!
          %li
            %a{:href => '/logout'} Log out
        - else
          %li
            %a{:href => '/login'} Log in
          %li
            %a{:href => '/signup'} Sign up
      #title
        Kwerk - 
        %a{:href => 'http://github.com/erikpukinskis/kwerk'} source code
    = yield

@@ index
- if logged_in?
  %form{:onsubmit => "handle_add_item_form_submit(this); return false;"}
    %input{:type => 'text', :name => 'description'}
    %label{:for => 'blue_button', :class => 'blue'}
      %input{:type => 'radio', :name => 'color', :value => 'blue'}
    %label{:for => 'blue_button', :class => 'red'}
      %input{:type => 'radio', :name => 'color', :value => 'red'}
    %label{:for => 'blue_button', :class => 'green'}
      %input{:type => 'radio', :name => 'color', :value => 'green'}
    %label{:for => 'blue_button', :class => 'yellow'}
      %input{:type => 'radio', :name => 'color', :value => 'yellow'}
    %input{:type => 'submit', :value => 'add'}  
  %iframe{:src => "board", :id => "board_frame"}
  #board

@@ board
%html
  %head
    %link{:rel => 'stylesheet', :type => 'text/css', :href => '/base.css'}
    %script{:type => 'text/javascript', :src => '/mootools.js'}    
    %script{:type => 'text/javascript', :src => '/board.js'}
  %body
    #board

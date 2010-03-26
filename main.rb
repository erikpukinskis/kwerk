require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'sinatra-authentication'

use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET'] || 'This is a secret key that no one will guess~'

class Something
  include DataMapper::Resource
  property :id, Serial
  property :stuff, String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/test.db")
DataMapper.auto_upgrade!

get '/' do
  haml :index
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
      #title Kwerk
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

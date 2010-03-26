## Kwerk

Kwerk is a game that helps you know what to work on, currently being invented by
[Kynthia Brunette](http://kynthiabru.net/). This software is a web-based version
of Kwerk, written in Ruby and easily deployable on Heroku

## How to play

If you just want to play kwerk, go to [http://kwerk.heroku.com].

## Development

If you want to hack on the kwerk code, here's what you've got to do...

### Local
If you want to download the code and play with it on your own computer, you'll
need to install [Ruby](http://www.ruby-lang.org) and [Rubygems](http://rubygems.org/). 
You'll also need to install the following gems:

    gem install sinatra haml dm-core sinatra-authentication data_objects do_postgres json

And then download the code and start the server:

    git clone git@github.com:erikpukinskis/kwerk.git
    cd kwerk
    ruby main.rb

If everything went according to plan, you should be able to navigate to [http://localhost:4567] 
and play with it. If you are going to be making lots of changes,
[http://github.com/rtomayko/shotgun](shotgun) will make your life easier.

### Deploying to Heroku

If you make some changes and want to get your new version on the web, it's a snap to deploy
with Heroku. Follow the instructions for local development, and then from within the kwerk
folder, do:

    gem install heroku
    heroku create supa_dupa_kwerk --stack bamboo-mri-1.9.1
    git push heroku master

... of course, replace "supa_dupa_kwerk" with whatever name you want to give your version
of kwerk.

### Contributing your code

If you add something cool to Kwerk, fork 
[the main kwerk repository](http://github.com/erikpukinskis/kwerk), push your changes, and
send a pull request.  If your work looks good it'll get merged and pushed to the main Kwerk
site.

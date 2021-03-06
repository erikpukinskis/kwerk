## Kwerk

Kwerk is a game that helps you know what to work on, currently being invented by
[Kynthia Brunette](http://kynthiabru.net/). This software is a web-based version
of Kwerk, written in Ruby with [Sinatra](http://www.sinatrarb.com/) and 
[Datamapper](http://datamapper.org/), and easily deployable on [Heroku](http://heroku.com/).

## How to play

If you just want to play kwerk, go to [http://kwerk.heroku.com](http://kwerk.heroku.com).

## Development

If you want to hack on the kwerk code, here's what you've got to do...

### Local
To download the code and play with it on your own computer, you'll
need to install [Ruby](http://www.ruby-lang.org), [Rubygems](http://rubygems.org/),
and [Git](http://git-scm.com/).
You'll also need to install the following gems:

    gem install sinatra haml dm-core sinatra-authentication data_objects do_postgres json

And then download the code and start the server:

    git clone git@github.com:erikpukinskis/kwerk.git
    cd kwerk
    ruby main.rb

If everything went according to plan, you should be able to navigate to 
[http://localhost:4567](http://localhost:4567) 
and play with it. If you are going to be making lots of changes,
[Shotgun](http://github.com/rtomayko/shotgun) will make your life easier.

### Deploying to Heroku

If you make some changes and want to get your new version on the web, it's a snap to deploy
with Heroku. Follow the instructions for local development, and then from within the kwerk
folder, do:

    gem install heroku
    heroku create supa_dupa_kwerk --stack bamboo-mri-1.9.1
    git push heroku master

... of course, replace "supa_dupa_kwerk" with whatever name you want to give your version
of kwerk.  Your version of Kwerk will then be up and running at 
http://whatever_name_you_chose.heroku.com

### Contributing your code

If you add something cool to Kwerk, fork 
[the main kwerk repository](http://github.com/erikpukinskis/kwerk), push your changes, and
send a pull request on Github. Some good instructions on how to do this are 
[here](http://help.github.com/forking/). If your work looks good it'll get merged and pushed 
to the main Kwerk site. 

## Credits

This software was written by Erik Pukinskis <erik@snowedin.net> so far.  Help out!

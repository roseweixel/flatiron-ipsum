---
  language: ruby
  tags: sinatra, forms, hashes, object orientation, mvc, rest, erb, ActiveRecord
  resources: 2
---

# Sinatra Pigeon

## Objectives

Create a Sinatra app that lists all pigeons, can create new ones, shows individual pigeons and their characteristics on their own, edits a pigeon, and deletes one pigeon at time.

## Instructions

* Fork this repo. 
* Clone your fork and cd into the newly created directory.
* From terminal run `bundle install`. 
* To view a list of available rake tasks, run `rake -T`.
* Write your migration for pigeons. Take a look at `db/seeds.rb` for table's structure hints.
* Run `rake db:migrate` to migrate the pigeon table.
* Run `rake db:seed` to load the information in the seed file into your database.
* In `app/models/pigeons.rb`, write your pigeon model.
* Flesh out the `app/controllers/pigeons_controller.rb` and views to fulfill the requirements below. Remember to make use of the appropriate RESTful paths to create, read, update, and destroy pigeons. 

## Requirements
* Include the following paths:
  * /pigeons
  * /pigeons/new
  * /pigeons/:id
  * /pigeons/:id/edit
  * /pigeons/:id/update - remember to add `use Rack::MethodOverride` to the `config.ru` file for patch requests
  * /pigeons/:id/destroy
* These routes will map to the appropriate views  `app/views/pigeon`:
  * index.erb
  * new.erb
  * show.erb
  * edit.erb
* Fill in these views with the appropriate ERB code and HTML to match the example solution at:  
  * [http://sinatra-pigeon.herokuapp.com/](http://sinatra-pigeon.herokuapp.com/).
* Run `shotgun` in terminal to test out the web app at [localhost:9393/](http://localhost:9393/).
* Run `rake db:migrate SINATRA_ENV=test` before running `rspec`.

## Resources
* [Heroku](http://www.heroku.com/) - [Pigeon App](http://sinatra-pigeon.herokuapp.com/pigeons)
* [Screencasts](http://screencasts.org/) - [Using ActiveRecord with Sinatra](http://screencasts.org/episodes/activerecord-with-sinatra)

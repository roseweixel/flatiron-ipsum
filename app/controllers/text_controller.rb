class TextController < ApplicationController

  get '/' do
    redirect :'/text/new'
  end

  get '/text/new' do 
    
    erb :'text/new'
  end

  post '/text' do
    redirect :'text/show'
  end

  get '/text/show' do
    if params[:paragraphs] != ""
      @text = Text.new(params[:paragraphs].to_i).paragraphs
    else
      @text = Text.new.paragraphs
    end
    erb :'text/show'
  end

end
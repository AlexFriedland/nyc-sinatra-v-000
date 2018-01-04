class LandmarksController < ApplicationController

  get '/' do
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end
end

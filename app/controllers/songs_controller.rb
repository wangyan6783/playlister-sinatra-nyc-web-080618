class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end


  get '/songs/new' do
    @artists = Artist.all
    erb :"/songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    # redirect "/songs/#{@song.slug}"
    erb :"songs/show"
  end

  get "/songs/:id" do
    @song = Song.find(params[:id])
    erb :"songs/show"
  end

  post '/songs' do
    if params[:artist_id]
       Song.create(name: params[:song_name], artist_id: params[:artist_id])
    else
      @new_artist = Artist.create(name: params[:artist_name])
      Song.create(name: params[:song_name], artist_id: @new_artist.id)
    end
  end






end

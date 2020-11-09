class SongsController < ApplicationController

    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params :title, :artist_name, :released, :release_year, :genre)
        # binding.pry
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :new
        end

    end

    def show
    end

    def edit
    end

    def update
        # binding.pry
        @song.attributes = song_params :title, :artist_name, :released, :release_year, :genre
        # binding.pry

        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private
    def set_song
        @song = Song.find_by(id: params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end

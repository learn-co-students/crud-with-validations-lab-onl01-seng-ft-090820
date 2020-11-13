class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update]

    def index 
        @songs = Song.all
    end 

    def new 
        @song = Song.new 
    end 

    def create  
        # binding.pry
        @song = Song.new(song_params)
        if @song.valid? 
            @song.save 
            redirect_to song_path(@song)
        else  
            render :new 
        end 
    end 

    def show
        # @song = Song.find_by(id: params[:id])
    end 

    def edit
        # @song = Song.find_by(id: params[:id]) 
    end 

    def update
        # @song = Song.find_by(id: params[:id])
        if @song.update(song_params) 
            redirect_to song_path(@song)
        else  
            render :edit 
        end 

        def destroy
            Song.find(params[:id]).destroy
            redirect_to songs_path
          end
    end 

    private 
    def song_params
        params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
    end 
    
    def set_song
        @song = Song.find_by(id: params[:id])
    end 

end
class SongsController < ApplicationController

    def new
        @song = Song.new
    end

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.new(song_params(:title, :artist_name, :release_year, :released))
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        @song = Song.find(params[:id])
        if  @song.update(song_params(:title, :artist_name, :release_year, :released))
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])

        @song.destroy
        redirect_to songs_url
    end

    private
    
    def song_params(*args)
          params.require(:song).permit(*args)
    end
end
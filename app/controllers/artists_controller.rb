class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @bands = @billboard.artists
  end

  def show
  end

  def new
    @band = @billboard.artists.new
  end

  def create
    @band = @billboard.artists.new(band_params)
    if @band.save
      redirect_to billboard_artists_path(@billboard)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(band_params)
      redirect_to billboard_artists_path(@billboard.id)
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to billboard_artists_path(@billboard.id)
  end

  private

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def band_params
    params.require(:artist).permit(:artist_name, :genre)
  end

end

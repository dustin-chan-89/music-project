class BandsController < ApplicationController
  def create
    @band = Band.new(params[:name])
    if @band.save
      render :index
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def index
    @bands = Band.all
    render :index
  end

  def update
    @band = current_band.find(params[:id])
    render :new
  end

  def destroy
  end
end

class BandsController < ApplicationController
  def create
    @band = Band.new(
      name: params[:band][:name])
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

  def edit
    @band = current_band
    render :edit
  end

  def update
    @band = current_band
    render :new
  end

  def show
    @band = current_band
    render :show
  end

  def destroy
  end

end

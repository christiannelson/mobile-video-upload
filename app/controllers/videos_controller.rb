class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params) do |video|
      video.file_type = params[:filetype]
      video.file_size = params[:filesize]
    end

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      #params.permit(:filesize, :filetype)
      params.require(:video).permit(:video_url)
    end
end

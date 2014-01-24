class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def upload_started
    @video = Video.new
    @video.state = :pending
    @video.upload_started_at = Time.current
    @video.save!
    render json: { video_id: @video.id }
  end

  def upload_completed
    @video = Video.find(params[:video_id])
    @video.update(video_params)
    @video.state = :uploaded
    @video.upload_completed_at = Time.current
    @video.file_type = params[:filetype]
    @video.file_size = params[:filesize]
    @video.save!
    #render json: { success: true }
    flash[:notice] = 'Uploaded successfully!'
    flash.keep(:notice)
    render js: "window.location = '#{video_path(@video)}'"
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
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
      params.require(:video).permit(:video_url)
    end
end

module VideosHelper

  def video_state(video)
    video.state.titleize
  end

  def video_link(video, truncate = true)
    if video.video_url
      displayed_url = truncate ? truncate(video.video_url, length: 48) : video.video_url
      link_to displayed_url, video.video_url
    else
      '-'
    end
  end

  def video_size(video)
    if video.file_size
      number_to_human_size(video.file_size)
    else
      '-'
    end
  end

  def video_type(video)
    if video.file_type
      video.file_type
    else
      '-'
    end
  end

  def video_upload_time(video)
    if video.upload_started_at && video.upload_completed_at
      distance_of_time_in_words(video.upload_started_at, video.upload_completed_at, include_seconds: true)
    else
      '-'
    end
  end
end

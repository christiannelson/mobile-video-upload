# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    video_url 'http://example.com/video.mov'
    file_type 'video/quicktime'
    file_size 423891
  end
end

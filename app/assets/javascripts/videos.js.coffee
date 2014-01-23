# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load_page_specific_javascript = ->
  $('#s3-uploader').S3Uploader
    progress_bar_target: $('.js-progress-bars')
    remove_completed_progress_bar: false
    allow_multiple_files: false

jQuery ->
  $(document).ready(load_page_specific_javascript)
  $(document).on('page:load', load_page_specific_javascript)


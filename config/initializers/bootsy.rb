# Use this setup block to configure all options available in Bootsy.
Bootsy.setup do |config|
  # Default editor options
  #   You can also override them locally by passing an
  #   editor_options hash to bootsy_area
  # config.editor_options = {
  #   blockquote: true,
  #   color: true,
  #   emphasis: true,
  #   font_styles: true,
  #   html: false,
  #   image: true,
  #   link: true,
  #   lists: true
  # }
  #
  # Image versions available
  #  Possible values: :small, :medium, :large and/or :original
  config.image_versions_available = [:small, :medium, :large, :original]
  #
  #
  # SMALL IMAGES
  #
  # Width limit for small images
   config.small_image[:width] = 320
  #
  # Height limit for small images
  # config.small_image[:height] = 160
  #
  #
  # MEDIUM IMAGES
  #
  # Width limit for medium images
   config.medium_image[:width] = 640
  #
  # Height limit for medium images
  # config.medium_image[:height] = 360
  #
  #
  # LARGE IMAGES
  #
  # Width limit for large images
   config.large_image[:width] = 1280
  #
  # Height limit for large images
  # config.large_image[:height] = 760
  #
  #
  # Whether user can destroy uploaded files
  # config.allow_destroy = true
  #
  #
  # Storage mode
  #   You can change the sorage mode below from :file to :fog if you want
  #   to use Amazon S3 and other cloud services. If you do that, please add
  #   'fog' to your Gemfile and create and configure your credentials in an
  #   initializer file, as described in Carrierwave's docs:
  #   https://github.com/carrierwaveuploader/carrierwave#using-amazon-s3
  # config.storage = :file
  #
  #
  # Store directory (inside 'public') for storage = :file
  #   BE CAREFUL! Changing this may break previously uploaded file paths!
  # config.store_dir = 'uploads'
  #
  #
  # Specify the controller to inherit from. Using ApplicationController
  # allows you to perform authentication from within your app.
  # config.base_controller = ActionController::Base
end

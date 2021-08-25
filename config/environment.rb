# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#Replace :local by :cloudinary in the config
config.active_storage.service = :cloudinary

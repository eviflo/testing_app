require "shrine"
require "shrine/storage/file_system"
require "image_processing/mini_magick"


Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :validation_helpers

#Shrine.plugin :logging, logger: Rails.logger

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
}
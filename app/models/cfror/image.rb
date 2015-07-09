module Cfror
  class Image < ActiveRecord::Base
    mount_uploader :body, Cfror::ImageUploader

    belongs_to :dataable, polymorphic: true
    belongs_to :field
  end
end

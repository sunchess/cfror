module Cfror
  class Field < ActiveRecord::Base
    belongs_to :fieldable, polymorphic: true
    has_many :strings, dependent: :destroy
  end
end

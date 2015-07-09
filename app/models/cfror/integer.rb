module Cfror
  class Integer < ActiveRecord::Base
    belongs_to :dataable, polymorphic: true
    belongs_to :field
  end
end

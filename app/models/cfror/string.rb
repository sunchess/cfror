module Cfror
  class String < ActiveRecord::Base
    belongs_to :dataable, polymorphic: true
    belongs_to :field
  end
end

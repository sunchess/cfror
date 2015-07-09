module Cfror
  class Boolean < ActiveRecord::Base
    belongs_to :dataable, polymorphic: true
    belongs_to :field
  end
end

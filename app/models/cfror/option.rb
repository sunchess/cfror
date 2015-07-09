module Cfror
  class Option < ActiveRecord::Base
    belongs_to :dataable, polymorphic: true
    belongs_to :field
    belongs_to :select_option
  end
end

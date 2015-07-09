require 'spec_helper'

module Cfror
  describe Option do
    before do
      @obj = Cfror::Option.new
    end

    it{expect(@obj).to respond_to :select_option}
    it{expect(@obj).to respond_to :field}
    it{expect(@obj).to respond_to :dataable}
  end
end

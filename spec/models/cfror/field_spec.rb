require 'spec_helper'

module Cfror
  describe Field do
    before do
      @obj = Cfror::Field.new
    end

    it{expect(@obj).to respond_to :fieldable}
    it{expect(@obj).to respond_to :strings}
  end
end

require 'spec_helper'

module Cfror
  describe Integer do
    before do
      @obj = Cfror::Integer.new
    end

    it{expect(@obj).to respond_to :body}
    it{expect(@obj).to respond_to :field}
    it{expect(@obj).to respond_to :dataable}
  end
end

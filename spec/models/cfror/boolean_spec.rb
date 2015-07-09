require 'spec_helper'

module Cfror
  describe Boolean do
    before do
      @obj = Cfror::Boolean.new
    end
    
    it{expect(@obj).to respond_to :body}
    it{expect(@obj).to respond_to :field}
    it{expect(@obj).to respond_to :dataable}
  end
end

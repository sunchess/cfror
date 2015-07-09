require 'spec_helper'

module Cfror
  describe Datetime do
    before do
      @obj = Cfror::Datetime.new
    end
    
    it{expect(@obj).to respond_to :body}
    it{expect(@obj).to respond_to :field}
    it{expect(@obj).to respond_to :dataable}
  end
end

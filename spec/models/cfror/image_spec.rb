require 'spec_helper'

module Cfror
  describe Image do
    before do
      @obj = Cfror::Image.new
    end
    
    it{expect(@obj).to respond_to :body}
    it{expect(@obj).to respond_to :field}
    it{expect(@obj).to respond_to :dataable}
    it{expect(@obj.body).to respond_to :url}
  end
end

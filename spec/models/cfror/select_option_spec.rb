require 'spec_helper'

module Cfror
  describe SelectOption do
    before do
      @obj = Cfror::SelectOption.new
    end

    it{expect(@obj).to respond_to :body}
    it{expect(@obj).to respond_to :field}
  end
end

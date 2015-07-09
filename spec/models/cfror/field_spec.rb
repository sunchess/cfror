require 'spec_helper'

module Cfror
  describe Field do
    before do
      @obj = Cfror::Field.new
    end

    it{expect(@obj).to respond_to :fieldable}
    it{expect(@obj).to respond_to :strings}
    it{expect(@obj).to respond_to :integers}
    it{expect(@obj).to respond_to :booleans}
    it{expect(@obj).to respond_to :dates}
    it{expect(@obj).to respond_to :datetimes}
    it{expect(@obj).to respond_to :options}
    it{expect(@obj).to respond_to :select_options}
  end
end

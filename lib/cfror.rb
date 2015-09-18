require "cfror/engine"

module Cfror
  #Including to fields model
  module Fields
    extend ActiveSupport::Concern

    included do
      has_many :fields, as: :fieldable, class_name: Cfror::Field, dependent: :destroy
      accepts_nested_attributes_for :fields, allow_destroy: true, reject_if: :all_blank
    end
  end

  #Including to data model
  module Data
    extend ActiveSupport::Concern

    included do
      has_many :boolean_datums, as: :dataable, class_name: Cfror::Boolean, dependent: :destroy
      #accepts_nested_attributes_for :boolean_datums, allow_destroy: true, reject_if: :all_blank

      has_many :date_datums, as: :dataable, class_name: Cfror::Date, dependent: :destroy
      #accepts_nested_attributes_for :date_datums, allow_destroy: true, reject_if: :all_blank

      has_many :datetime_datums, as: :dataable, class_name: Cfror::Datetime, dependent: :destroy
      #accepts_nested_attributes_for :datetime_datums, allow_destroy: true, reject_if: :all_blank

      has_many :image_datums, as: :dataable, class_name: Cfror::Image, dependent: :destroy
      #accepts_nested_attributes_for :image_datums, allow_destroy: true, reject_if: :all_blank

      has_many :integer_datums, as: :dataable, class_name: Cfror::Integer, dependent: :destroy
      #accepts_nested_attributes_for :image_datums, allow_destroy: true, reject_if: :all_blank

      has_many :option_datums, as: :dataable, class_name: Cfror::Option, dependent: :destroy
      #accepts_nested_attributes_for :option_datums, allow_destroy: true, reject_if: :all_blank

      has_many :string_datums, as: :dataable, class_name: Cfror::String, dependent: :destroy
      #accepts_nested_attributes_for :string_datums, allow_destroy: true, reject_if: :all_blank

      has_many :text_datums, as: :dataable, class_name: Cfror::Text, dependent: :destroy
      #accepts_nested_attributes_for :text_datums, allow_destroy: true, reject_if: :all_blank
    end

    #save fields value
    def save_cfror_fields(fields)
      fields.each do |field, value|
        field = Cfror::Field.find(field)
        field.save_value!(self, value)
      end
    end

    #set values for fields
    #@param source is symbol of relation method contains include Cfror::Fields
    def value_fields_for(source, order=nil)
      fields = self.send(source).fields

      fields = fields.order(order) if order

      fields.each do |i|
        i.set_value_for(self)
      end

      fields
    end
  end
end

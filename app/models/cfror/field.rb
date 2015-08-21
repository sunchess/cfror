module Cfror
  class Field < ActiveRecord::Base
    enum field_type: [ :string, :text, :integer, :boolean, :date, :option, :image, :datetime ]

    attr_accessor :value_object

    belongs_to :fieldable, polymorphic: true

    has_many :select_options, dependent: :destroy
    accepts_nested_attributes_for :select_options, allow_destroy: true

    has_many :strings, dependent: :destroy
    has_many :texts, dependent: :destroy
    has_many :integers, dependent: :destroy
    has_many :booleans, dependent: :destroy
    has_many :dates, dependent: :destroy
    has_many :datetimes, dependent: :destroy
    has_many :options, dependent: :destroy
    has_many :images, dependent: :destroy


    def save_value!(model, value)
      type = field_type.to_sym

      if type == :option
        save_option!(model, value)
      else
        data = send("#{field_type}s").find_by(dataable: model)
        if data
          data.update_attribute(:body, value)
        else
          send("#{field_type}s").create!(dataable: model, body: value)
        end
      end
    end

    def save_option!(model, value)
      option_data = self.options.find_by(dataable: model)
      if option_data
        option_data.update_attribute(:select_option, SelectOption.find(value))
      else
        options.create!(dataable: model, select_option: SelectOption.find(value))
      end
    end

    def set_value_for(model)
      type = field_type.to_sym

      self.value_object = if type == :option
                    self.options.find_by(dataable: model).try(:select_option)
                  else
                    send("#{field_type}s").find_by(dataable: model)
                  end
    end

    def value
      self.value_object.try(:body)
    end


  end
end

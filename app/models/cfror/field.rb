module Cfror
  class Field < ActiveRecord::Base
    enum field_type: [ :string, :text, :integer, :boolean, :date, :option ]

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
  end
end

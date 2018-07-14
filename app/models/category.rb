class Category < ApplicationRecord
  has_many :books

  extend Mobility
  translates :title, locale_accessors: true
end

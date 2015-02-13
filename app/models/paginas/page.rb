module Paginas
  class Page < ActiveRecord::Base
    belongs_to :category
    validates :title, presence: true
  end
end

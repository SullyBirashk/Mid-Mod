class Actor < ApplicationRecord
  belongs_to :movie

  def self.ordered_by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end

end

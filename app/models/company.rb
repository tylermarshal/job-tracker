class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three_companies
    select("companies.*, avg(level_of_interest)")
    .joins(:jobs)
    .group(:name)
    .order("avg(level_of_interest) DESC")
    .average(:level_of_interest).first(3).to_h
  end
end

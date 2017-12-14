class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.count_jobs_by_interest(low,high)
    where("level_of_interest > #{low} AND level_of_interest <= #{high}").count
  end

  def self.count_jobs_by_location
    group(:city).order("count(*) DESC").count
  end
end

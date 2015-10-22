class Album < ActiveRecord::Base

  validates :band_id, :title, presence: true
  validates :live, inclusion: {in: [true, false]}

  belongs_to :band, dependent: :destroy

  has_many :tracks

end

class Album < ActiveRecord::Base

  validates :band_id, :title, :live, presence: true

  belongs_to :band, dependent: :destroy

  has_many :tracks

end

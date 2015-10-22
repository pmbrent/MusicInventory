class Track < ActiveRecord::Base

  validates :album_id, :title, presence: true
  validates :bonus, inclusion: {in: [true, false]}

  belongs_to :album, dependent: :destroy

  has_one(
    :band,
    through: :album
  )

end

class Track < ActiveRecord::Base

  validates :album_id, :bonus, :title, presence: true

  belongs_to :album, dependent: :destroy

  has_one(
    :band,
    through: :album
  )

end

class Track < ActiveRecord::Base

  belongs_to :album, dependent: :destroy

  has_one(
    :band,
    through: :album
  )

end

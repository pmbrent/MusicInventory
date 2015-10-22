class Album < ActiveRecord::Base

  belongs_to :band, dependent: :destroy

  has_many :tracks

end

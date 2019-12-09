class Conferenceroom < ApplicationRecord
  belongs_to :facility
  has_many :events, dependent: :destroy
end

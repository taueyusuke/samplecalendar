class Facility < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :conferencerooms, dependent: :destroy
end

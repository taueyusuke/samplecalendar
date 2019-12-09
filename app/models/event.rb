class Event < ApplicationRecord
  belongs_to :conferenceroom
  belongs_to :user
end

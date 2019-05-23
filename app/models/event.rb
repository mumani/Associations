class Event < ApplicationRecord

    scope :upcoming, -> { where("event_date >= ?", Date.today) }
    scope :past, -> { where("event_date < ?", Date.today) }


    belongs_to :creator, class_name: "User"
    has_many :attended_events, foreign_key: "attended_event_id"
    has_many :attendees, through: :attended_events, source: :attendee
end

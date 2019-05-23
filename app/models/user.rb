class User < ApplicationRecord

    has_many :events, foreign_key: "creator_id", class_name: "Event"
    has_many :attended_events, foreign_key: "attendee_id"
    has_many :event_attendance, through: :attended_events, source: :attended_event


    def upcoming_events
        self.event_attendance.where("event_date > ?", Date.today)
    end
    
    def previous_events
        self.event_attendance.where("event_date < ?", Date.today)
    end
end

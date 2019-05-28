class User < ApplicationRecord

    has_many :events, foreign_key: "creator_id", class_name: "Event"
    has_many :attendances, foreign_key: "attendee_id"
    has_many :event_attendance, through: :attendances, source: :attended_event


    def upcoming_events_to_attend
        self.event_attendance.where("event_date > ?", Date.today)
    end
    
    def previous_attended_events
        self.event_attendance.where("event_date < ?", Date.today)
    end
end

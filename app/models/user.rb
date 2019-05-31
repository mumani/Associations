class User < ApplicationRecord

    has_many :events, foreign_key: "creator_id", class_name: "Event"
    has_many :attendances, foreign_key: "attendee_id"
    has_many :attended_events, through: :attendances


    def upcoming_events_to_attend
        self.attended_events.where("event_date > ?", Date.today)
    end
    
    def previous_attended_events
        self.attended_events.where("event_date < ?", Date.today)
    end
end

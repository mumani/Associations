module EventsHelper
    def can_attend?(event)
        return current_user.attended_events.exists?(event.id) || event.event_date < Date.today
    end
end

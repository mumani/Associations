module EventsHelper
    def can_attend?(event)
        return current_user.event_attendance.exists?(event.id) || event.event_date < Date.today
    end
end

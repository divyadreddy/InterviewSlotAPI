class Interview < ApplicationRecord
   after_create :after_create_action
   after_update :after_update_action
   after_destroy :after_destroy_action

   def self.participants_available(start_time, end_time, interviewer_id, interviewee_id)
    time_clash = Interview.where("(end_time BETWEEN ? AND ?) or (start_time BETWEEN ? AND ?) or ((end_time > ?) and (start_time < ?))", start_time, end_time, start_time, end_time, end_time, start_time)
    if time_clash.where("interviewer_id = ?", interviewer_id).exists?
     #  return false, "Interviewer " + Interviewer.find(interviewer_id).email.to_s + " is not available"
      return false, "Interviewer"
    end
    if time_clash.where("interviewee_id = ?", interviewee_id).exists?
     #  return false, "Interviewee with " + Interviewee.find(interviewee_id).email.to_s + " is not available"
      return false, "Interviewee"
    end
    return true
  end

   private
   def after_create_action
        InterviewMailer.interview_scheduled(self).deliver_later(wait_until: Time.now)
        InterviewMailer.interview_scheduled_reminder(self).deliver_later(wait_until: (self.start_time - Time.now - 30.minutes).seconds.from_now)
   end
   def after_update_action
        InterviewMailer.interview_schedule_updated(self).deliver_later(wait_until: Time.now)
        InterviewMailer.interview_scheduled_reminder(self).deliver_later(wait_until: (self.start_time - Time.now - 30.minutes).seconds.from_now)
   end
   def after_destroy_action
        InterviewMailer.interview_scheduled_deleted(self).deliver_now(wait_until: Time.now)
   end
   
end

class InterviewMailer < ApplicationMailer

  def interview_scheduled(interview)
    @interview = interview
    mail(to: [Interviewee.find(@interview.interviewee_id).email, Interviewer.find(@interview.interviewer_id).email], subject: @interview.title + " Interview Schedule" )
  end

  def interview_schedule_updated(interview)
    @interview = interview
    mail(to: [Interviewee.find(@interview.interviewee_id).email, Interviewer.find(@interview.interviewer_id).email], subject: @interview.title + " Interview Schedule Updated" )
  end

  def interview_schedule_deleted(interview)
    @interview = interview
    mail(to: [Interviewee.find(@interview.interviewee_id).email, Interviewer.find(@interview.interviewer_id).email], subject: @interview.title + " Interview Cancelled" )
  end

  def interview_scheduled_reminder(interview)
    @interview = interview
    mail(to: [Interviewee.find(@interview.interviewee_id).email, Interviewer.find(@interview.interviewer_id).email], subject: "Reminder: "  + @interview.title + " Interview Scheduled in 30 minutes" )
  end
end
 
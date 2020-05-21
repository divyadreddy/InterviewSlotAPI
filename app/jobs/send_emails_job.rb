class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(interview)
    # Do something later
    # InterviewMailer.interview_scheduled(interview: interview).deliver_now
  end

end

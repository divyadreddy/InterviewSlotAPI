class Interviewee < ApplicationRecord
    has_one_attached :resume
    def resume_present?
        if !resume.blank? 
            return 'yes'
        else
            return 'no'
        end
    end
end

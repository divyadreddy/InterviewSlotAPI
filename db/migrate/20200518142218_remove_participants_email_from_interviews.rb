class RemoveParticipantsEmailFromInterviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :interviews, :participants_email, :text
  end
end

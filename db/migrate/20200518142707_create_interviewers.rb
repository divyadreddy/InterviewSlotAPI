class CreateInterviewers < ActiveRecord::Migration[6.0]
  def change
    create_table :interviewers do |t|
      t.string :email

      t.timestamps
    end
  end
end

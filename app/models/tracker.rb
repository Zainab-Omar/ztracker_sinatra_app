class Tracker < ActiveRecord::Base
    belongs_to :user
    validates :gender, :exercise_time, :intake_cal, :burned_cal, :date, presence: true
end

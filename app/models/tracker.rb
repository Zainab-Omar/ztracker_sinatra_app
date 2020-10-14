class Tracker < ActiveRecord::Base
    belongs_to :user
    validates :date, :gender, :intake_cal, :burned_call, presence: true
end

class Tracker < ActiveRecord::Base
    belongs_to :user
    validates :gender, :intake_cal, :burned_call, presence: true
end

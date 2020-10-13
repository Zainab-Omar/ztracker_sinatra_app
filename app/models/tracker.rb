require 'bigdecimal'

class Tracker < ActiveRecord::Base
    belongs_to :user
end

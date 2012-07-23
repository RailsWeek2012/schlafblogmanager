class Schlafpost < ActiveRecord::Base
  belongs_to :user

  attr_accessible :anfang, :date, :description, :dream, :ende, :stimmung, :title, :user, :verpennt
  validates_presence_of :title, :stimmung, :description
end

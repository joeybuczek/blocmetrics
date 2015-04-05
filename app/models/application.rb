class Application < ActiveRecord::Base
  belongs_to :user
  has_many :events
  
  validates :name, presence: true
  validates :url, presence: true
  
end
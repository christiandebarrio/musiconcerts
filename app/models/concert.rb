class Concert < ActiveRecord::Base
  
  validates :band, 
            :venue, 
            :city, 
            :date, 
            :price, 
            :description, presence: true
  validates :price, numericality: { only_integer: true, :greater_than => 0 }
  validate :concert_date_cannot_be_in_the_past

  def concert_date_cannot_be_in_the_past
    if date < Date.today
      errors.add(:concert_date, "can't be in the past" )
    end
  end
end

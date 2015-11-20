class Concert < ActiveRecord::Base
  has_many :comments
  
  validates :band, 
            :venue, 
            :city, 
            :date, 
            :price, 
            :description, presence: true
  validates :price, numericality: { only_integer: true, :greater_than => 0 }
  validate :concert_date_cannot_be_in_the_past

  def concert_date_cannot_be_in_the_past
    if date < Date.current
      errors.add(:concert_date, "can't be in the past" )
    end
  end

  def self.available
    where("date > ?", Date.current)
  end

  def self.today
    where(date: Date.current.beginning_of_day..Date.current.end_of_day)
  end

  def self.order_asc
    order("date ASC")
  end

  def self.next_month
    date = Date.current + 1.month
    where(date: date.beginning_of_month..date.end_of_month)
  end
 

end

class Concert < ActiveRecord::Base
  
  validates :band, 
            :venue, 
            :city, 
            :date, 
            :price, 
            :description, presence: true
  validates :price, numericality: { only_integer: true, :greater_than => 0 }

end

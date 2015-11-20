class Comment < ActiveRecord::Base
  belongs_to :concert

  def self.order_desc
    order("date DESC")
  end

  def self.persisted
    where.not(id: nil)
  end
end

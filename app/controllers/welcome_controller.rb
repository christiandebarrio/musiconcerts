class WelcomeController < ApplicationController

  def index
    @concerts = Concert.today.order_asc
    @concerts_next = Concert.next_month
  end
end
